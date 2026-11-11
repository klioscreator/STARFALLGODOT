class_name CombatActionCatalog
extends RefCounted

static func create_prototype_actions() -> Dictionary:
	var actions: Dictionary = {}
	actions["move_step"] = _make_action(
		&"move_step", "Tactical movement", "movement", 1, 0.0,
		false, false, "none", 0, "any"
	)
	actions["weapon_attack"] = _make_action(
		&"weapon_attack", "Weapon attack", "weapon", 1, 4.4,
		true, true, "damage", 24, "enemy"
	)
	actions["player_skill"] = _make_action(
		&"player_skill", "Prototype skill", "skill", 2, 6.0,
		true, true, "damage", 34, "enemy"
	)
	actions["enemy_strike"] = _make_action(
		&"enemy_strike", "Enemy strike", "enemy", 1, 3.6,
		true, true, "damage", 8, "enemy"
	)
	return actions

static func _make_action(
	action_id: StringName,
	display_name: String,
	category: String,
	action_point_cost: int,
	range_meters: float,
	requires_target: bool,
	requires_line_of_sight: bool,
	effect_type: String,
	effect_value: int,
	target_relation: String
) -> CombatActionDefinition:
	return CombatActionDefinition.new(
		action_id, display_name, category, action_point_cost, range_meters,
		requires_target, requires_line_of_sight, effect_type, effect_value,
		target_relation
	)
