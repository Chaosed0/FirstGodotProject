class_name PlayerInput
extends Node

@export var player : Player

func _process(delta):
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		input_direction.x += 1
			
	if Input.is_action_pressed("move_left"):
		input_direction.x -= 1
		
	if Input.is_action_pressed("move_forward"):
		input_direction.y += 1
		
	if Input.is_action_pressed("move_back"):
		input_direction.y -= 1
		
	player.input_direction = input_direction
