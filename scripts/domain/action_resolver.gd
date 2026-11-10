class_name ActionResolver
extends RefCounted

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
