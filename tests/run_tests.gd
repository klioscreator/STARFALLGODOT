extends SceneTree

const CombatantState = preload("res://scripts/domain/combatant_state.gd")
const TurnManager = preload("res://scripts/domain/turn_manager.gd")

func _initialize() -> void:
	_test_combatant_state()
	_test_turn_manager()
	print("STARFALLGODOT Phase 03 domain tests: PASS")
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
	turns.start(["player", "enemy_a", "enemy_b"], {"player": 2, "enemy_a": 1, "enemy_b": 1})
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
