class_name ActionResolver
extends RefCounted

func can_resolve_action(action: CombatActionDefinition, target_state) -> bool:
	if action == null or not action.is_definition_valid():
		return false
	match action.effect_type:
		"none":
			return not action.requires_target
		"damage", "heal":
			return action.requires_target and target_state != null and target_state.is_alive
		_:
			return false

func resolve_action(action: CombatActionDefinition, target_state) -> Dictionary:
	if not can_resolve_action(action, target_state):
		return {"accepted": false, "reason": "invalid_action_effect"}
	match action.effect_type:
		"none":
			return {
				"accepted": true,
				"reason": "ok",
				"effect_type": "none",
				"amount": 0,
				"target_defeated": false
			}
		"damage":
			var damage_result := apply_damage(target_state, action.effect_value)
			damage_result["effect_type"] = "damage"
			damage_result["amount"] = damage_result["damage"]
			return damage_result
		"heal":
			var restored: int = target_state.restore_health(action.effect_value)
			return {
				"accepted": true,
				"reason": "ok",
				"effect_type": "heal",
				"amount": restored,
				"damage": 0,
				"target_defeated": false
			}
	return {"accepted": false, "reason": "unsupported_effect"}

func apply_damage(target_state, requested_damage: int) -> Dictionary:
	if target_state == null:
		return {"accepted": false, "reason": "missing_target", "damage": 0, "target_defeated": false}
	if not target_state.is_alive:
		return {"accepted": false, "reason": "target_not_alive", "damage": 0, "target_defeated": true}
	if requested_damage < 0:
		return {"accepted": false, "reason": "invalid_damage", "damage": 0, "target_defeated": false}
	var applied: int = target_state.apply_damage(requested_damage)
	return {
		"accepted": true,
		"reason": "ok",
		"damage": applied,
		"target_defeated": not target_state.is_alive
	}
