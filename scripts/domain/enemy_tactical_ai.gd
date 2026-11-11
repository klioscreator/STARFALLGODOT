class_name EnemyTacticalAI
extends RefCounted

# This class only proposes an action from a read-only snapshot.
# The combat action pipeline remains responsible for validation and resolution.
func propose_action(snapshot: Dictionary, action_definitions: Dictionary) -> Dictionary:
	var actor_id: String = str(snapshot.get("actor_id", ""))
	var target_id: String = str(snapshot.get("target_id", ""))
	var distance: float = float(snapshot.get("distance", INF))
	if actor_id.is_empty() or target_id.is_empty():
		return {"accepted": false, "reason": "invalid_snapshot"}

	var strike: CombatActionDefinition = action_definitions.get("enemy_strike") as CombatActionDefinition
	if strike != null and distance <= strike.range_meters:
		return {
			"accepted": true,
			"actor_id": actor_id,
			"target_id": target_id,
			"action_id": "enemy_strike"
		}

	return {
		"accepted": true,
		"actor_id": actor_id,
		"target_id": "",
		"approach_target_id": target_id,
		"action_id": "move_step"
	}
