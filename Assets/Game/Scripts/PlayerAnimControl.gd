class_name PlayerAnimControl
extends AnimationTree

@export var movement : Movement

var is_moving : bool
var move_speed : float

func _process(delta):
	var move_proportion : float = movement.target_velocity.length() / movement.speed;
	move_speed = move_proportion

	set("parameters/Movement/MoveBlend/blend_amount", move_speed * 2)
