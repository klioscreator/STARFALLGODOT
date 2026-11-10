class_name PlayerController
extends CharacterBody3D
@export var move_speed: float = 5.0
@export var gravity_strength: float = 22.0
var camera_rig: CameraRig
var game_controller: Node
var external_move_input: Vector2 = Vector2.ZERO
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity_strength * delta
	else:
		velocity.y = 0.0
	if game_controller != null and game_controller.combat_active:
		velocity.x = move_toward(velocity.x, 0.0, move_speed * 10.0 * delta)
		velocity.z = move_toward(velocity.z, 0.0, move_speed * 10.0 * delta)
		move_and_slide()
		return
	var raw := Vector2.ZERO
	if Input.is_key_pressed(KEY_A):
		raw.x -= 1.0
	if Input.is_key_pressed(KEY_D):
		raw.x += 1.0
	if Input.is_key_pressed(KEY_W):
		raw.y -= 1.0
	if Input.is_key_pressed(KEY_S):
		raw.y += 1.0
	raw = (raw + external_move_input).limit_length(1.0)
	var direction := Vector3.ZERO
	if camera_rig != null and raw.length_squared() > 0.001:
		direction = (camera_rig.get_flat_right() * raw.x + camera_rig.get_flat_forward() * -raw.y).normalized()
	if direction.length_squared() > 0.001:
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
		rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z), 12.0 * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, move_speed * 8.0 * delta)
		velocity.z = move_toward(velocity.z, 0.0, move_speed * 8.0 * delta)
	move_and_slide()
