class_name PlayerInput
extends Node

@export var movement : Movement
@export var interactor : PlayerInteraction

func _process(delta):
	var input_direction = Vector2.ZERO
		
	if Input.is_action_just_pressed("interact"):
		print("yea")
		interactor.begin_interacting()

	if interactor.is_interacting():
		movement.clear_movement();
		return
	
	if Input.is_action_pressed("move_right"):
		input_direction.x += 1
			
	if Input.is_action_pressed("move_left"):
		input_direction.x -= 1
		
	if Input.is_action_pressed("move_forward"):
		input_direction.y += 1
		
	if Input.is_action_pressed("move_back"):
		input_direction.y -= 1
		
	movement.input_direction = input_direction
