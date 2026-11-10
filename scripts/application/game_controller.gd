extends Node3D

const CombatantState = preload("res://scripts/domain/combatant_state.gd")
const TurnManager = preload("res://scripts/domain/turn_manager.gd")
const PlayerController = preload("res://scripts/presentation/player_controller.gd")
const CameraRig = preload("res://scripts/presentation/camera_rig.gd")

const PLAYER_ID := "player"
const ENEMY_IDS: Array[String] = ["enemy_scout", "enemy_guard"]
const TACTICAL_STEP := 1.35
const PLAYER_ATTACK_DAMAGE := 24
const PLAYER_SKILL_DAMAGE := 34
const ENEMY_ATTACK_DAMAGE := 8

var player: PlayerController
var camera_rig: CameraRig
var player_state
var enemies: Dictionary = {}
var turn_manager
var combat_active: bool = false
var enemy_turn_running: bool = false
var selected_target_id: String = "enemy_scout"
var combat_log: String = "Explore the test area, then start the encounter."

var status_label: Label
var health_label: Label
var turn_label: Label
var target_label: Label
var log_label: Label
var start_button: Button
var attack_button: Button
var skill_button: Button
var end_turn_button: Button
var target_button: Button
var restart_button: Button
var camera_button: Button

func _ready() -> void:
	_build_environment()
	_build_player()
	_build_enemies()
	_build_interface()
	_update_hud()

func _build_environment() -> void:
	var world_environment := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color(0.025, 0.035, 0.055)
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment.ambient_light_color = Color(0.38, 0.46, 0.62)
	environment.ambient_light_energy = 0.65
	world_environment.environment = environment
	add_child(world_environment)

	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-52.0, -28.0, 0.0)
	sun.light_energy = 1.15
	add_child(sun)

	var floor_body := StaticBody3D.new()
	floor_body.name = "ArenaFloor"
	floor_body.collision_layer = 1
	var floor_shape := CollisionShape3D.new()
	var floor_box := BoxShape3D.new()
	floor_box.size = Vector3(48.0, 0.2, 48.0)
	floor_shape.shape = floor_box
	floor_body.add_child(floor_shape)
	floor_body.position.y = -0.1
	add_child(floor_body)

	var floor_mesh := MeshInstance3D.new()
	var plane := PlaneMesh.new()
	plane.size = Vector2(48.0, 48.0)
	floor_mesh.mesh = plane
	var floor_material := StandardMaterial3D.new()
	floor_material.albedo_color = Color(0.075, 0.095, 0.13)
	floor_material.roughness = 0.92
	floor_mesh.material_override = floor_material
	floor_mesh.position.y = 0.0
	add_child(floor_mesh)

	_add_obstacle(Vector3(3.5, 0.0, -1.5), Vector3(1.8, 1.2, 1.0), Color(0.22, 0.29, 0.38))
	_add_obstacle(Vector3(-3.5, 0.0, 2.5), Vector3(1.5, 1.7, 1.5), Color(0.20, 0.26, 0.35))
	_add_obstacle(Vector3(1.0, 0.0, 5.0), Vector3(2.6, 0.8, 0.8), Color(0.27, 0.31, 0.39))
	_add_obstacle(Vector3(-5.0, 0.0, -4.0), Vector3(1.0, 2.2, 1.0), Color(0.17, 0.23, 0.32))

func _add_obstacle(at: Vector3, dimensions: Vector3, tint: Color) -> void:
	var body := StaticBody3D.new()
	body.position = at + Vector3.UP * dimensions.y * 0.5
	body.collision_layer = 1
	var shape_node := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = dimensions
	shape_node.shape = shape
	body.add_child(shape_node)
	add_child(body)

	var visual := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	mesh.size = dimensions
	visual.mesh = mesh
	var material := StandardMaterial3D.new()
	material.albedo_color = tint
	material.metallic = 0.22
	material.roughness = 0.72
	visual.material_override = material
	body.add_child(visual)

func _build_player() -> void:
	player = PlayerController.new()
	player.name = "Player"
	player.position = Vector3(0.0, 0.05, 0.0)
	player.collision_layer = 2
	player.collision_mask = 1

	var collider := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.38
	capsule.height = 1.8
	collider.shape = capsule
	collider.position.y = 0.9
	player.add_child(collider)

	var visual := MeshInstance3D.new()
	var mesh := CapsuleMesh.new()
	mesh.radius = 0.38
	mesh.height = 1.8
	visual.mesh = mesh
	visual.position.y = 0.9
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.18, 0.68, 0.95)
	material.metallic = 0.38
	material.roughness = 0.42
	visual.material_override = material
	player.add_child(visual)

	camera_rig = CameraRig.new()
	camera_rig.name = "CameraRig"
	camera_rig.position = Vector3(0.0, 1.48, 0.0)
	player.add_child(camera_rig)
	player.camera_rig = camera_rig
	player.game_controller = self
	add_child(player)

	player_state = CombatantState.new(PLAYER_ID, "Operative", 100, "player")

func _build_enemies() -> void:
	_spawn_enemy("enemy_scout", "Raider Scout", Vector3(6.0, 0.05, -2.0), Color(0.92, 0.34, 0.22), 48)
	_spawn_enemy("enemy_guard", "Raider Guard", Vector3(7.0, 0.05, 3.0), Color(0.72, 0.22, 0.30), 58)

func _spawn_enemy(actor_id: String, actor_name: String, at: Vector3, tint: Color, health: int) -> void:
	var body := CharacterBody3D.new()
	body.name = actor_id
	body.position = at
	body.collision_layer = 2
	body.collision_mask = 1

	var collider := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.42
	capsule.height = 1.8
	collider.shape = capsule
	collider.position.y = 0.9
	body.add_child(collider)

	var visual := MeshInstance3D.new()
	var mesh := CapsuleMesh.new()
	mesh.radius = 0.42
	mesh.height = 1.8
	visual.mesh = mesh
	visual.position.y = 0.9
	var material := StandardMaterial3D.new()
	material.albedo_color = tint
	material.metallic = 0.18
	material.roughness = 0.5
	visual.material_override = material
	body.add_child(visual)
	add_child(body)

	enemies[actor_id] = {
		"node": body,
		"state": CombatantState.new(actor_id, actor_name, health, "enemy")
	}

func _build_interface() -> void:
	var canvas := CanvasLayer.new()
	canvas.name = "PrototypeUI"
	add_child(canvas)

	var root := Control.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	canvas.add_child(root)

	var info_panel := PanelContainer.new()
	info_panel.position = Vector2(16.0, 16.0)
	info_panel.custom_minimum_size = Vector2(330.0, 180.0)
	root.add_child(info_panel)
	var info_box := VBoxContainer.new()
	info_panel.add_child(info_box)

	var title := Label.new()
	title.text = "STARFALLGODOT | PROTOTYPE 03"
	title.add_theme_font_size_override("font_size", 17)
	info_box.add_child(title)

	status_label = Label.new()
	health_label = Label.new()
	turn_label = Label.new()
	target_label = Label.new()
	log_label = Label.new()
	log_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	for label in [status_label, health_label, turn_label, target_label, log_label]:
		info_box.add_child(label)

	var action_panel := PanelContainer.new()
	action_panel.anchor_left = 1.0
	action_panel.anchor_top = 1.0
	action_panel.anchor_right = 1.0
	action_panel.anchor_bottom = 1.0
	action_panel.offset_left = -286.0
	action_panel.offset_top = -238.0
	action_panel.offset_right = -16.0
	action_panel.offset_bottom = -16.0
	root.add_child(action_panel)
	var action_box := VBoxContainer.new()
	action_panel.add_child(action_box)

	camera_button = _make_button("Switch camera (V)", action_box, _toggle_camera)
	start_button = _make_button("Start encounter", action_box, _start_encounter)
	target_button = _make_button("Next target", action_box, _select_next_target)
	attack_button = _make_button("Weapon attack", action_box, _player_attack)
	skill_button = _make_button("Use skill", action_box, _player_skill)
	end_turn_button = _make_button("End turn", action_box, _end_player_turn)
	restart_button = _make_button("Restart test", action_box, _restart_test)

	var dpad_panel := PanelContainer.new()
	dpad_panel.anchor_top = 1.0
	dpad_panel.anchor_bottom = 1.0
	dpad_panel.offset_left = 16.0
	dpad_panel.offset_top = -166.0
	dpad_panel.offset_right = 212.0
	dpad_panel.offset_bottom = -16.0
	root.add_child(dpad_panel)
	var grid := GridContainer.new()
	grid.columns = 3
	dpad_panel.add_child(grid)

	var spacer_a := Control.new()
	spacer_a.custom_minimum_size = Vector2(48.0, 42.0)
	grid.add_child(spacer_a)
	_bind_move_button(_make_button("▲", grid), Vector2.UP)
	var spacer_b := Control.new()
	spacer_b.custom_minimum_size = Vector2(48.0, 42.0)
	grid.add_child(spacer_b)
	_bind_move_button(_make_button("◀", grid), Vector2.LEFT)
	_bind_move_button(_make_button("▼", grid), Vector2.DOWN)
	_bind_move_button(_make_button("▶", grid), Vector2.RIGHT)

func _make_button(button_text: String, parent: Node, callback: Callable = Callable()) -> Button:
	var button := Button.new()
	button.text = button_text
	button.custom_minimum_size = Vector2(118.0, 42.0)
	parent.add_child(button)
	if callback.is_valid():
		button.pressed.connect(callback)
	return button

func _bind_move_button(button: Button, direction: Vector2) -> void:
	button.custom_minimum_size = Vector2(48.0, 42.0)
	button.button_down.connect(_on_move_button_down.bind(direction))
	button.button_up.connect(_on_move_button_up)

func _on_move_button_down(direction: Vector2) -> void:
	if combat_active:
		_tactical_step(direction)
	else:
		player.external_move_input = direction

func _on_move_button_up() -> void:
	if player != null:
		player.external_move_input = Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	if not combat_active or not (event is InputEventKey):
		return
	if not event.pressed or event.echo:
		return
	match event.keycode:
		KEY_W:
			_tactical_step(Vector2.UP)
		KEY_S:
			_tactical_step(Vector2.DOWN)
		KEY_A:
			_tactical_step(Vector2.LEFT)
		KEY_D:
			_tactical_step(Vector2.RIGHT)
		KEY_V:
			_toggle_camera()

func _toggle_camera() -> void:
	camera_rig.toggle_camera_mode()
	camera_button.text = "Camera: First person" if camera_rig.first_person else "Camera: Third person"

func _start_encounter() -> void:
	if combat_active:
		return
	player_state.reset()
	for actor_id in ENEMY_IDS:
		var data: Dictionary = enemies[actor_id]
		data["state"].reset()
		data["node"].visible = true
	enemies["enemy_scout"]["node"].position = Vector3(6.0, 0.05, -2.0)
	enemies["enemy_guard"]["node"].position = Vector3(7.0, 0.05, 3.0)
	player.position = Vector3.ZERO
	selected_target_id = "enemy_scout"
	turn_manager = TurnManager.new()
	turn_manager.start([PLAYER_ID, "enemy_scout", "enemy_guard"], {
		PLAYER_ID: 2,
		"enemy_scout": 1,
		"enemy_guard": 1
	})
	combat_active = true
	combat_log = "Encounter started. Turn/action values are temporary test parameters."
	_update_hud()

func _alive_enemy_ids() -> Array[String]:
	var alive: Array[String] = []
	for actor_id in ENEMY_IDS:
		if enemies[actor_id]["state"].is_alive:
			alive.append(actor_id)
	return alive

func _alive_actor_ids() -> Array[String]:
	var alive: Array[String] = []
	if player_state.is_alive:
		alive.append(PLAYER_ID)
	alive.append_array(_alive_enemy_ids())
	return alive

func _selected_enemy_data() -> Dictionary:
	if enemies.has(selected_target_id) and enemies[selected_target_id]["state"].is_alive:
		return enemies[selected_target_id]
	for actor_id in ENEMY_IDS:
		if enemies[actor_id]["state"].is_alive:
			selected_target_id = actor_id
			return enemies[actor_id]
	return {}

func _select_next_target() -> void:
	var alive := _alive_enemy_ids()
	if alive.is_empty():
		return
	var index := alive.find(selected_target_id)
	selected_target_id = alive[(index + 1) % alive.size()]
	combat_log = "Target selected: " + enemies[selected_target_id]["state"].display_name
	_update_hud()

func _player_attack() -> void:
	if not _player_can_act():
		return
	var target := _selected_enemy_data()
	if target.is_empty():
		_finish_combat(true)
		return
	var target_node: CharacterBody3D = target["node"]
	var target_state = target["state"]
	if player.global_position.distance_to(target_node.global_position) > 4.4:
		combat_log = "Target is out of weapon range. Move closer."
		_update_hud()
		return
	if not turn_manager.consume(PLAYER_ID, 1):
		return
	var damage: int = target_state.apply_damage(PLAYER_ATTACK_DAMAGE)
	_update_enemy_visibility(selected_target_id)
	combat_log = "Weapon attack dealt %d damage to %s." % [damage, target_state.display_name]
	_after_player_action()

func _player_skill() -> void:
	if not _player_can_act():
		return
	var target := _selected_enemy_data()
	if target.is_empty():
		_finish_combat(true)
		return
	var target_node: CharacterBody3D = target["node"]
	var target_state = target["state"]
	if player.global_position.distance_to(target_node.global_position) > 6.0:
		combat_log = "Target is out of skill range."
		_update_hud()
		return
	if not turn_manager.consume(PLAYER_ID, 2):
		combat_log = "Not enough action points. End the turn or use a weapon action."
		_update_hud()
		return
	var damage: int = target_state.apply_damage(PLAYER_SKILL_DAMAGE)
	_update_enemy_visibility(selected_target_id)
	combat_log = "Prototype skill dealt %d damage to %s." % [damage, target_state.display_name]
	_after_player_action()

func _tactical_step(direction_2d: Vector2) -> void:
	if not _player_can_act():
		return
	var direction := camera_rig.get_flat_right() * direction_2d.x
	direction += camera_rig.get_flat_forward() * -direction_2d.y
	direction.y = 0.0
	direction = direction.normalized()
	if direction.length_squared() < 0.001:
		return
	if not turn_manager.consume(PLAYER_ID, 1):
		combat_log = "Not enough action points to move."
		_update_hud()
		return
	var motion := direction * TACTICAL_STEP
	if not player.test_move(player.global_transform, motion):
		player.global_position += motion
		player.rotation.y = atan2(-direction.x, -direction.z)
		combat_log = "Tactical reposition completed."
	else:
		turn_manager.action_points[PLAYER_ID] = turn_manager.points_for(PLAYER_ID) + 1
		combat_log = "Movement blocked; no action point consumed."
	_update_hud()
	if turn_manager.points_for(PLAYER_ID) <= 0:
		_advance_turn()

func _player_can_act() -> bool:
	return combat_active and turn_manager != null and turn_manager.current_actor() == PLAYER_ID and player_state.is_alive

func _after_player_action() -> void:
	if _check_combat_end():
		return
	_update_hud()
	if turn_manager.points_for(PLAYER_ID) <= 0:
		_advance_turn()

func _end_player_turn() -> void:
	if not _player_can_act():
		return
	turn_manager.end_turn(PLAYER_ID)
	_advance_turn()

func _advance_turn() -> void:
	if not combat_active or _check_combat_end():
		return
	var next_actor := turn_manager.advance(_alive_actor_ids())
	if next_actor == PLAYER_ID:
		combat_log = "Round %d. Your turn." % turn_manager.round_number
	elif next_actor != "" and not enemy_turn_running:
		call_deferred("_run_enemy_turn")
	_update_hud()

func _run_enemy_turn() -> void:
	if enemy_turn_running or not combat_active:
		return
	enemy_turn_running = true
	while combat_active and turn_manager.current_actor() != PLAYER_ID:
		var actor_id := turn_manager.current_actor()
		if actor_id.is_empty():
			break
		await get_tree().create_timer(0.45).timeout
		if not combat_active or actor_id == PLAYER_ID:
			break
		var data: Dictionary = enemies[actor_id]
		var enemy_state = data["state"]
		var enemy_node: CharacterBody3D = data["node"]
		if not enemy_state.is_alive:
			_advance_turn()
			continue
		var distance := enemy_node.global_position.distance_to(player.global_position)
		if distance <= 3.6:
			var damage: int = player_state.apply_damage(ENEMY_ATTACK_DAMAGE)
			combat_log = "%s attacked for %d damage." % [enemy_state.display_name, damage]
		else:
			var direction := player.global_position - enemy_node.global_position
			direction.y = 0.0
			direction = direction.normalized()
			var motion := direction * 1.0
			if not enemy_node.test_move(enemy_node.global_transform, motion):
				enemy_node.global_position += motion
			combat_log = "%s advanced toward the operative." % enemy_state.display_name
		turn_manager.consume(actor_id, 1)
		if _check_combat_end():
			break
		_advance_turn()
	enemy_turn_running = false
	_update_hud()

func _check_combat_end() -> bool:
	if not player_state.is_alive:
		_finish_combat(false)
		return true
	if _alive_enemy_ids().is_empty():
		_finish_combat(true)
		return true
	return false

func _finish_combat(victory: bool) -> void:
	combat_active = false
	if turn_manager != null:
		turn_manager.running = false
	combat_log = "Encounter complete: VICTORY." if victory else "Encounter complete: DEFEAT."
	_update_hud()

func _restart_test() -> void:
	combat_active = false
	enemy_turn_running = false
	player_state.reset()
	for actor_id in ENEMY_IDS:
		var data: Dictionary = enemies[actor_id]
		data["state"].reset()
		data["node"].visible = true
	_start_encounter()

func _update_enemy_visibility(actor_id: String) -> void:
	if not enemies[actor_id]["state"].is_alive:
		enemies[actor_id]["node"].visible = false
		combat_log += " Target defeated."

func _update_hud() -> void:
	if status_label == null:
		return
	status_label.text = "MODE: TACTICAL ENCOUNTER" if combat_active else "MODE: EXPLORATION"
	health_label.text = "Operative HP: %d / %d" % [player_state.health, player_state.max_health]
	if combat_active and turn_manager != null:
		turn_label.text = "Round %d | Active: %s | AP: %d" % [
			turn_manager.round_number,
			turn_manager.current_actor(),
			turn_manager.points_for(turn_manager.current_actor())
		]
	else:
		turn_label.text = "WASD / touch pad: move | Right mouse / touch drag: look"
	var target := _selected_enemy_data()
	if target.is_empty():
		target_label.text = "Targets: none"
	else:
		var target_state = target["state"]
		target_label.text = "Target: %s — %d / %d HP" % [
			target_state.display_name,
			target_state.health,
			target_state.max_health
		]
	log_label.text = combat_log
	start_button.visible = not combat_active and player_state.is_alive and not _alive_enemy_ids().is_empty()
	attack_button.visible = combat_active
	skill_button.visible = combat_active
	end_turn_button.visible = combat_active
	target_button.visible = combat_active
	restart_button.visible = not combat_active and (not player_state.is_alive or _alive_enemy_ids().is_empty())
	if camera_button != null:
		camera_button.text = "Camera: First person" if camera_rig.first_person else "Camera: Third person"
