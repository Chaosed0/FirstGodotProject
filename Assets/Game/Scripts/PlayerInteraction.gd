class_name PlayerInteraction
extends Area3d

@export var interationRange : float = 6

func _ready():
	monitoring = true
	body_entered.connect(on_body_entered)

func on_body_entered(body);
