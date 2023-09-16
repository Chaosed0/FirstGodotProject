class_name PlayerAnimControl
extends AnimationTree

@export var player : Player

var is_moving : bool
var move_speed : float

func _process(delta):
	var move_proportion : float = player.target_velocity.length() / player.speed;
	move_speed = move_proportion

	set("parameters/Movement/MoveBlend/blend_amount", move_speed * 2)
