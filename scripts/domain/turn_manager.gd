class_name TurnManager
extends RefCounted
var order: Array[String] = []
var action_points: Dictionary = {}
var base_action_points: Dictionary = {}
var current_index: int = 0
var round_number: int = 1
var running: bool = false
func start(actor_order: Array[String], ap_by_actor: Dictionary) -> void:
	order = actor_order.duplicate()
	base_action_points = ap_by_actor.duplicate(true)
	action_points = ap_by_actor.duplicate(true)
	current_index = 0
	round_number = 1
	running = not order.is_empty()
func current_actor() -> String:
	if not running or order.is_empty():
		return ""
	return order[current_index]
func points_for(actor_id: String) -> int:
	return int(action_points.get(actor_id, 0))
func consume(actor_id: String, cost: int = 1) -> bool:
	if not running or current_actor() != actor_id or cost <= 0:
		return false
	var available := points_for(actor_id)
	if available < cost:
		return false
	action_points[actor_id] = available - cost
	return true
func end_turn(actor_id: String) -> bool:
	if not running or current_actor() != actor_id:
		return false
	action_points[actor_id] = 0
	return true
func advance(alive_actor_ids: Array[String]) -> String:
	if not running or order.is_empty():
		return ""
	for _attempt in range(order.size()):
		current_index = (current_index + 1) % order.size()
		var candidate: String = order[current_index]
		if alive_actor_ids.has(candidate):
			if candidate == order[0]:
				round_number += 1
			action_points[candidate] = int(base_action_points.get(candidate, 1))
			return candidate
	running = false
	return ""
