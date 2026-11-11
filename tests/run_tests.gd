extends SceneTree

const CombatantState = preload("res://scripts/domain/combatant_state.gd")
const TurnManager = preload("res://scripts/domain/turn_manager.gd")
const ActionValidator = preload("res://scripts/domain/action_validator.gd")
const ActionResolver = preload("res://scripts/domain/action_resolver.gd")
const CombatActionDefinition = preload("res://scripts/domain/combat_action_definition.gd")
const CombatActionCatalog = preload("res://scripts/domain/combat_action_catalog.gd")
const CombatActionPipeline = preload("res://scripts/domain/combat_action_pipeline.gd")
const EnemyTacticalAI = preload("res://scripts/domain/enemy_tactical_ai.gd")

func _initialize() -> void:
	_test_combatant_state()
	_test_turn_manager()
	_test_action_validation_and_resolution()
	_test_enemy_decision_boundary()
	print("STARFALLGODOT Phase 04 combat domain tests: PASS")
	quit(0)

func _test_combatant_state() -> void:
	var actor = CombatantState.new("test", "Test Actor", 100, "player")
	assert(actor.health == 100)
	assert(actor.apply_damage(35) == 35)
	assert(actor.health == 65)
	assert(actor.restore_health(20) == 20)
	assert(actor.health == 85)
	assert(actor.apply_damage(200) == 85)
	assert(not actor.is_alive)
	actor.reset()
	assert(actor.is_alive and actor.health == 100)

func _test_turn_manager() -> void:
	var turns = TurnManager.new()
	turns.start(["player", "enemy_a", "enemy_b"], {
		"player": 2,
		"enemy_a": 1,
		"enemy_b": 1
	})
	assert(turns.current_actor() == "player")
	assert(turns.points_for("player") == 2)
	assert(not turns.consume("enemy_a", 1))
	assert(turns.consume("player", 1))
	assert(turns.points_for("player") == 1)
	assert(turns.end_turn("player"))
	assert(turns.advance(["player", "enemy_a", "enemy_b"]) == "enemy_a")
	assert(turns.consume("enemy_a", 1))
	assert(turns.advance(["player", "enemy_b"]) == "enemy_b")
	assert(turns.advance(["player", "enemy_b"]) == "player")
	assert(turns.round_number == 2)
	assert(turns.points_for("player") == 2)

	var skip_turns = TurnManager.new()
	skip_turns.start(["player", "defeated_actor", "enemy"], {
		"player": 1,
		"defeated_actor": 1,
		"enemy": 1
	})
	assert(skip_turns.end_turn("player"))
	assert(skip_turns.advance(["player", "enemy"]) == "enemy")
	assert(skip_turns.end_turn("enemy"))
	assert(skip_turns.advance(["player", "enemy"]) == "player")
	assert(skip_turns.round_number == 2)

func _test_action_validation_and_resolution() -> void:
	var player = CombatantState.new("player", "Operative", 100, "player")
	var enemy = CombatantState.new("enemy", "Raider", 50, "enemy")
	var actors: Dictionary = {"player": player, "enemy": enemy}
	var turns = TurnManager.new()
	turns.start(["player", "enemy"], {"player": 2, "enemy": 1})
	var actions: Dictionary = CombatActionCatalog.create_prototype_actions()
	var pipeline = CombatActionPipeline.new()

	var out_of_range: Dictionary = pipeline.execute(
		"player", "enemy", "weapon_attack", actions, actors, turns, 8.0, true
	)
	assert(not out_of_range["accepted"])
	assert(out_of_range["reason"] == "target_out_of_range")
	assert(turns.points_for("player") == 2)
	assert(enemy.health == 50)

	var blocked: Dictionary = pipeline.execute(
		"player", "enemy", "weapon_attack", actions, actors, turns, 2.0, false
	)
	assert(not blocked["accepted"])
	assert(blocked["reason"] == "line_of_sight_blocked")
	assert(turns.points_for("player") == 2)
	assert(enemy.health == 50)

	var wrong_target: CombatantState = CombatantState.new("friend", "Friendly", 50, "player")
	actors["friend"] = wrong_target
	var friendly_fire: Dictionary = pipeline.execute(
		"player", "friend", "weapon_attack", actions, actors, turns, 2.0, true
	)
	assert(not friendly_fire["accepted"])
	assert(friendly_fire["reason"] == "target_must_be_enemy")
	assert(turns.points_for("player") == 2)
	assert(wrong_target.health == 50)

	var attack: Dictionary = pipeline.execute(
		"player", "enemy", "weapon_attack", actions, actors, turns, 2.0, true
	)
	assert(attack["accepted"])
	assert(attack["action_points_spent"] == 1)
	assert(turns.points_for("player") == 1)
	assert(enemy.health == 26)

	var insufficient_ap: Dictionary = pipeline.execute(
		"player", "enemy", "player_skill", actions, actors, turns, 2.0, true
	)
	assert(not insufficient_ap["accepted"])
	assert(insufficient_ap["reason"] == "insufficient_action_points")
	assert(turns.points_for("player") == 1)
	assert(enemy.health == 26)

	var invalid_definition: CombatActionDefinition = CombatActionDefinition.new(
		&"invalid", "Invalid", "weapon", 1, 4.0, true, true,
		"unsupported", 10, "enemy"
	)
	actions["invalid"] = invalid_definition
	var invalid_action: Dictionary = pipeline.execute(
		"player", "enemy", "invalid", actions, actors, turns, 2.0, true
	)
	assert(not invalid_action["accepted"])
	assert(turns.points_for("player") == 1)
	assert(enemy.health == 26)

	assert(turns.end_turn("player"))
	assert(turns.advance(["player", "enemy"]) == "enemy")
	var enemy_attack: Dictionary = pipeline.execute(
		"enemy", "player", "enemy_strike", actions, actors, turns, 2.0, true
	)
	assert(enemy_attack["accepted"])
	assert(player.health == 92)

func _test_enemy_decision_boundary() -> void:
	var ai = EnemyTacticalAI.new()
	var actions: Dictionary = CombatActionCatalog.create_prototype_actions()
	var close_proposal: Dictionary = ai.propose_action({
		"actor_id": "enemy",
		"target_id": "player",
		"distance": 2.5
	}, actions)
	assert(close_proposal["accepted"])
	assert(close_proposal["action_id"] == "enemy_strike")

	var distant_proposal: Dictionary = ai.propose_action({
		"actor_id": "enemy",
		"target_id": "player",
		"distance": 8.0
	}, actions)
	assert(distant_proposal["accepted"])
	assert(distant_proposal["action_id"] == "move_step")
	assert(distant_proposal["approach_target_id"] == "player")

	var invalid_proposal: Dictionary = ai.propose_action({}, actions)
	assert(not invalid_proposal["accepted"])
