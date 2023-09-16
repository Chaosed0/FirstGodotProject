class_name Player
extends CharacterBody3D

@export var speed = 14
@export var gravity = 75

var input_direction = Vector3.ZERO

var target_velocity = Vector3.ZERO
const rotated_forward = Vector3(-0.707, 0, -0.707)
const rotated_right = Vector3(0.707, 0, -0.707)

func _physics_process(delta):
	var direction = input_direction.y * rotated_forward + input_direction.x * rotated_right;
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (gravity * delta)
	else:
		target_velocity.y = 0
		
	velocity = target_velocity
	move_and_slide()
