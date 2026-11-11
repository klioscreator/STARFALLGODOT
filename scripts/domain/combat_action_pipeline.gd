class_name CombatActionPipeline
extends RefCounted

const ActionValidator = preload("res://scripts/domain/action_validator.gd")
const ActionResolver = preload("res://scripts/domain/action_resolver.gd")

var validator: ActionValidator
var resolver: ActionResolver

func _init() -> void:
	validator = ActionValidator.new()
	resolver = ActionResolver.new()

func execute(
	actor_id: String,
	target_id: String,
	action_id: String,
	action_definitions: Dictionary,
	combatants: Dictionary,
	turn_manager: TurnManager,
	distance: float = 0.0,
	has_line_of_sight: bool = true
) -> Dictionary:
	if turn_manager == null or not turn_manager.running:
		return _rejected("encounter_not_running")
	if not action_definitions.has(action_id):
		return _rejected("unknown_action")
	var action: CombatActionDefinition = action_definitions[action_id] as CombatActionDefinition
	if action == null or not action.is_definition_valid():
		return _rejected("invalid_action_definition")

	var actor_state: CombatantState = combatants.get(actor_id) as CombatantState
	if actor_state == null:
		return _rejected("missing_actor")
	var target_state: CombatantState = combatants.get(target_id) as CombatantState if not target_id.is_empty() else null

	var validation: Dictionary = validator.validate_action(
		actor_id,
		turn_manager.current_actor(),
		actor_state.is_alive,
		turn_manager.points_for(actor_id),
		action.action_point_cost,
		action.requires_target,
		target_state != null,
		target_state != null and target_state.is_alive,
		distance,
		action.range_meters,
		action.requires_line_of_sight,
		has_line_of_sight
	)
	if not validation["accepted"]:
		return _rejected(str(validation["reason"]))

	if action.requires_target and target_state != null and action.target_relation != "any":
		var same_team: bool = actor_state.team == target_state.team
		if action.target_relation == "enemy" and same_team:
			return _rejected("target_must_be_enemy")
		if action.target_relation == "ally" and not same_team:
			return _rejected("target_must_be_ally")

	if not resolver.can_resolve_action(action, target_state):
		return _rejected("invalid_action_effect")

	# Validation and effect preflight complete before AP is spent or state is changed.
	if not turn_manager.consume(actor_id, action.action_point_cost):
		return _rejected("action_points_changed")

	var effect_result: Dictionary = resolver.resolve_action(action, target_state)
	if not effect_result["accepted"]:
		return _rejected(str(effect_result["reason"]))

	return {
		"accepted": true,
		"reason": "ok",
		"action_id": action_id,
		"action_points_spent": action.action_point_cost,
		"effect": effect_result
	}

func _rejected(reason: String) -> Dictionary:
	return {
		"accepted": false,
		"reason": reason,
		"action_points_spent": 0
	}
