class_name Movement
extends Node3D

@export var pivot : Node3D
@export var body : CharacterBody3D
@export var speed = 14
@export var gravity = 75

var input_direction := Vector2.ZERO
var target_velocity := Vector3.ZERO
@export var direction := Vector3.ZERO
const rotated_forward := Vector3(-0.707, 0, -0.707)
const rotated_right := Vector3(0.707, 0, -0.707)

func _physics_process(delta):
	direction = input_direction.y * rotated_forward + input_direction.x * rotated_right;
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		transform.basis = Basis()
		var angle : float = -atan2(direction.z, direction.x);
		rotate_object_local(Vector3(0,1,0), angle)
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not body.is_on_floor():
		target_velocity.y = target_velocity.y - (gravity * delta)
	else:
		target_velocity.y = 0
		
	body.velocity = target_velocity
	body.move_and_slide()

func clear_movement():
	input_direction = Vector2.ZERO
