extends SceneTree

const MainScene = preload("res://scenes/main.tscn")

func _initialize() -> void:
	var watchdog := create_timer(45.0)
	watchdog.timeout.connect(_on_watchdog_timeout)
	call_deferred("_run_integration_checks")

func _on_watchdog_timeout() -> void:
	push_error("Combat integration test timed out.")
	quit(1)

func _check(condition: bool, message: String) -> bool:
	if condition:
		return true
	push_error(message)
	quit(1)
	return false

func _run_integration_checks() -> void:
	var controller: Node = MainScene.instantiate()
	root.add_child(controller)
	await process_frame

	if not _check(not controller.get("combat_active"), "Prototype should begin in exploration mode."):
		return

	var camera_rig: Node = controller.get("camera_rig")
	if not _check(camera_rig != null, "Camera rig should be created."):
		return
	var initial_camera_mode: bool = camera_rig.get("first_person")
	controller.call("_toggle_camera")
	if not _check(camera_rig.get("first_person") != initial_camera_mode, "Camera toggle should change perspective."):
		return
	controller.call("_toggle_camera")
	if not _check(camera_rig.get("first_person") == initial_camera_mode, "Camera toggle should return to the original perspective."):
		return

	controller.call("_start_encounter")
	if not _check(controller.get("combat_active"), "Starting an encounter should enter tactical mode."):
		return
	var turn_manager = controller.get("turn_manager")
	if not _check(turn_manager.current_actor() == "player", "Player should own the first turn."):
		return

	var enemies: Dictionary = controller.get("enemies")
	var scout_data: Dictionary = enemies["enemy_scout"]
	var scout_node: Node3D = scout_data["node"]
	var scout_state = scout_data["state"]
	scout_node.position = Vector3(2.0, 0.05, 0.0)

	controller.call("_player_attack")
	if not _check(scout_state.health == scout_state.max_health - 24, "Player weapon action should resolve through the combat pipeline."):
		return
	if not _check(turn_manager.points_for("player") == 1, "Accepted player action should consume its configured fixture cost."):
		return

	controller.call("_player_skill")
	if not _check(scout_state.health == scout_state.max_health - 24, "Skill must be rejected when the actor lacks its action-point cost."):
		return
	if not _check(turn_manager.points_for("player") == 1, "Rejected skill must not consume action points."):
		return

	controller.call("_end_player_turn")
	await create_timer(1.6).timeout
	if not _check(controller.get("player_state").health < 100, "Enemy action should resolve through the shared combat pipeline."):
		return
	if not _check(turn_manager.current_actor() == "player", "Enemy phase should return turn ownership to the player."):
		return

	for actor_id in ["enemy_scout", "enemy_guard"]:
		var actor_data: Dictionary = enemies[actor_id]
		var actor_state = actor_data["state"]
		actor_state.apply_damage(actor_state.max_health)

	var victory_finished: bool = controller.call("_check_combat_end")
	if not _check(victory_finished, "Defeating all enemies should finish the encounter."):
		return
	if not _check(not controller.get("combat_active"), "Victory should leave tactical mode."):
		return
	if not _check(str(controller.get("combat_log")).contains("VICTORY"), "Victory state should be reported."):
		return

	controller.call("_restart_test")
	if not _check(controller.get("combat_active"), "Restart should begin a fresh encounter."):
		return
	if not _check(controller.get("player_state").is_alive, "Restart should restore player health."):
		return
	for actor_id in ["enemy_scout", "enemy_guard"]:
		var actor_data: Dictionary = enemies[actor_id]
		if not _check(actor_data["state"].is_alive, "Restart should restore every enemy."):
			return
		if not _check(actor_data["node"].visible, "Restart should show every enemy."):
			return

	var player_state = controller.get("player_state")
	player_state.apply_damage(player_state.max_health)
	var defeat_finished: bool = controller.call("_check_combat_end")
	if not _check(defeat_finished, "Player defeat should finish the encounter."):
		return
	if not _check(not controller.get("combat_active"), "Defeat should leave tactical mode."):
		return
	if not _check(str(controller.get("combat_log")).contains("DEFEAT"), "Defeat state should be reported."):
		return

	controller.call("_restart_test")
	if not _check(controller.get("combat_active"), "A defeated encounter should also be restartable."):
		return
	if not _check(controller.get("player_state").is_alive, "Restart after defeat should restore player health."):
		return

	controller.queue_free()
	await process_frame
	print("STARFALLGODOT Phase 04 combat integration tests: PASS")
	quit(0)
