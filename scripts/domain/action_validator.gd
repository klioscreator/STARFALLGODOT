class_name ActionValidator
extends RefCounted

func validate_actor_action(
	actor_id: String,
	active_actor_id: String,
	actor_is_alive: bool,
	available_action_points: int,
	action_cost: int
) -> Dictionary:
	if actor_id != active_actor_id:
		return {"accepted": false, "reason": "not_active_actor"}
	if not actor_is_alive:
		return {"accepted": false, "reason": "actor_not_alive"}
	if action_cost <= 0:
		return {"accepted": false, "reason": "invalid_action_cost"}
	if available_action_points < action_cost:
		return {"accepted": false, "reason": "insufficient_action_points"}
	return {"accepted": true, "reason": "ok"}

func validate_range(distance: float, maximum_range: float) -> Dictionary:
	if maximum_range < 0.0 or distance < 0.0:
		return {"accepted": false, "reason": "invalid_range"}
	if distance > maximum_range:
		return {"accepted": false, "reason": "target_out_of_range"}
	return {"accepted": true, "reason": "ok"}
