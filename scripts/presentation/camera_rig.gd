class_name CameraRig
extends Node3D
@export var mouse_sensitivity: float = 0.0025
@export var touch_sensitivity: float = 0.004
var spring_arm: SpringArm3D
var camera: Camera3D
var first_person_body_visual: GeometryInstance3D
var first_person: bool = false
var _pitch: float = -0.12
var _mouse_look_enabled: bool = false
func _ready() -> void:
	spring_arm = SpringArm3D.new()
	spring_arm.name = "CameraSpringArm"
	spring_arm.collision_mask = 1
	spring_arm.margin = 0.15
	add_child(spring_arm)
	camera = Camera3D.new()
	camera.name = "Camera3D"
	camera.current = true
	spring_arm.add_child(camera)
	set_camera_mode(false)
func set_camera_mode(use_first_person: bool) -> void:
	first_person = use_first_person
	if spring_arm == null:
		return
	if first_person:
		spring_arm.spring_length = 0.08
		camera.position = Vector3(0.0, 0.0, 0.12)
	else:
		spring_arm.spring_length = 4.2
		camera.position = Vector3.ZERO
	if first_person_body_visual != null:
		first_person_body_visual.visible = not first_person
func toggle_camera_mode() -> void:
	set_camera_mode(not first_person)
func get_flat_forward() -> Vector3:
	var forward := -global_basis.z
	forward.y = 0.0
	return forward.normalized()
func get_flat_right() -> Vector3:
	var right := global_basis.x
	right.y = 0.0
	return right.normalized()
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		_mouse_look_enabled = event.pressed
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if event.pressed else Input.MOUSE_MODE_VISIBLE
	elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		_mouse_look_enabled = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseMotion and _mouse_look_enabled:
		_apply_look(event.relative, mouse_sensitivity)
	elif event is InputEventScreenDrag:
		_apply_look(event.relative, touch_sensitivity)
func _apply_look(relative_motion: Vector2, sensitivity: float) -> void:
	rotation.y -= relative_motion.x * sensitivity
	_pitch = clampf(_pitch - relative_motion.y * sensitivity, deg_to_rad(-65.0), deg_to_rad(70.0))
	spring_arm.rotation.x = _pitch
