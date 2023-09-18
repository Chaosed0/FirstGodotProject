extends Control

func _process(delta):
	var player : Player = get_tree().get_nodes_in_group("Player")[0]
	visible = player.interaction.hoveredInteractable != null
