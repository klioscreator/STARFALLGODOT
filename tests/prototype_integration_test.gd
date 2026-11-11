extends SceneTree

const MainScene = preload("res://scenes/main.tscn")

func _initialize() -> void:
	call_deferred("_run_integration_checks")

func _run_integration_checks() -> void:
	var controller: Node = MainScene.instantiate()
	root.add_child(controller)
	await process_frame

	assert(not controller.get("combat_active"), "Prototype should begin in exploration mode.")

	var camera_rig: Node = controller.get("camera_rig")
	assert(camera_rig != null, "Camera rig should be created.")
	var initial_camera_mode: bool = camera_rig.get("first_person")
	controller.call("_toggle_camera")
	assert(camera_rig.get("first_person") != initial_camera_mode, "Camera toggle should change perspective.")
	controller.call("_toggle_camera")
	assert(camera_rig.get("first_person") == initial_camera_mode, "Camera toggle should return to the original perspective.")

	controller.call("_start_encounter")
	assert(controller.get("combat_active"), "Starting an encounter should enter tactical mode.")
	var turn_manager = controller.get("turn_manager")
	assert(turn_manager.current_actor() == "player", "Player should own the first turn.")

	var enemies: Dictionary = controller.get("enemies")
	for actor_id in ["enemy_scout", "enemy_guard"]:
		var actor_data: Dictionary = enemies[actor_id]
		var actor_state = actor_data["state"]
		actor_state.apply_damage(actor_state.max_health)

	var victory_finished: bool = controller.call("_check_combat_end")
	assert(victory_finished, "Defeating all enemies should finish the encounter.")
	assert(not controller.get("combat_active"), "Victory should leave tactical mode.")
	assert(str(controller.get("combat_log")).contains("VICTORY"), "Victory state should be reported.")

	controller.call("_restart_test")
	assert(controller.get("combat_active"), "Restart should begin a fresh encounter.")
	assert(controller.get("player_state").is_alive, "Restart should restore player health.")
	for actor_id in ["enemy_scout", "enemy_guard"]:
		var actor_data: Dictionary = enemies[actor_id]
		assert(actor_data["state"].is_alive, "Restart should restore every enemy.")
		assert(actor_data["node"].visible, "Restart should show every enemy.")

	var player_state = controller.get("player_state")
	player_state.apply_damage(player_state.max_health)
	var defeat_finished: bool = controller.call("_check_combat_end")
	assert(defeat_finished, "Player defeat should finish the encounter.")
	assert(not controller.get("combat_active"), "Defeat should leave tactical mode.")
	assert(str(controller.get("combat_log")).contains("DEFEAT"), "Defeat state should be reported.")

	controller.call("_restart_test")
	assert(controller.get("combat_active"), "A defeated encounter should also be restartable.")
	assert(controller.get("player_state").is_alive, "Restart after defeat should restore player health.")

	controller.queue_free()
	await process_frame
	print("STARFALLGODOT Phase 03 integration tests: PASS")
	quit(0)
