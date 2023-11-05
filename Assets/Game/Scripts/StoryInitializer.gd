class_name StoryInitializer
extends Node

@export var knot_path : String

var _storyUI : StoryUI

func _ready():
	_storyUI = get_tree().get_nodes_in_group("StoryUI")[0]
	_storyUI.load_story(knot_path)