class_name TurnManager
extends RefCounted

var order: Array[String] = []
var action_points: Dictionary = {}
var base_action_points: Dictionary = {}
var current_index: int = 0
var round_number: int = 1
var running: bool = false

func start(actor_order: Array[String], ap_by_actor: Dictionary) -> void:
	order.clear()
	for actor_id in actor_order:
		if not actor_id.is_empty() and not order.has(actor_id):
			order.append(actor_id)
	base_action_points = ap_by_actor.duplicate(true)
	action_points = ap_by_actor.duplicate(true)
	current_index = 0
	round_number = 1
	running = not order.is_empty()
	if running and points_for(order[0]) <= 0:
		running = false

func current_actor() -> String:
	if not running or order.is_empty() or current_index < 0 or current_index >= order.size():
		return ""
	return order[current_index]

func points_for(actor_id: String) -> int:
	return int(action_points.get(actor_id, 0))

func can_consume(actor_id: String, cost: int = 1) -> bool:
	return running and current_actor() == actor_id and cost > 0 and points_for(actor_id) >= cost

func consume(actor_id: String, cost: int = 1) -> bool:
	if not can_consume(actor_id, cost):
		return false
	action_points[actor_id] = points_for(actor_id) - cost
	return true

func end_turn(actor_id: String) -> bool:
	if not running or current_actor() != actor_id:
		return false
	action_points[actor_id] = 0
	return true

func advance(alive_actor_ids: Array[String]) -> String:
	if not running or order.is_empty():
		return ""

	var previous_index: int = current_index
	for _attempt in range(order.size()):
		current_index = (current_index + 1) % order.size()
		var candidate: String = order[current_index]
		if alive_actor_ids.has(candidate):
			if current_index <= previous_index:
				round_number += 1
			var next_points: int = int(base_action_points.get(candidate, 1))
			if next_points <= 0:
				continue
			action_points[candidate] = next_points
			return candidate

	running = false
	return ""

func stop() -> void:
	running = false
	action_points.clear()
