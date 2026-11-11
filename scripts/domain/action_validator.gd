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

func validate_action(
	actor_id: String,
	active_actor_id: String,
	actor_is_alive: bool,
	available_action_points: int,
	action_cost: int,
	target_required: bool,
	target_exists: bool,
	target_is_alive: bool,
	distance: float,
	maximum_range: float,
	requires_line_of_sight: bool,
	has_line_of_sight: bool
) -> Dictionary:
	var actor_result := validate_actor_action(
		actor_id, active_actor_id, actor_is_alive,
		available_action_points, action_cost
	)
	if not actor_result["accepted"]:
		return actor_result

	if target_required:
		if not target_exists:
			return {"accepted": false, "reason": "missing_target"}
		if not target_is_alive:
			return {"accepted": false, "reason": "target_not_alive"}
		var range_result := validate_range(distance, maximum_range)
		if not range_result["accepted"]:
			return range_result
		if requires_line_of_sight and not has_line_of_sight:
			return {"accepted": false, "reason": "line_of_sight_blocked"}

	return {"accepted": true, "reason": "ok"}
