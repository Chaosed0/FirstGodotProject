class_name StoryText
extends RichTextLabel

@export var charactersPerSecond : float

func set_story_text(storyText: String):
	var arr : PackedStringArray = storyText.split("\n", false)

	text = ""
	text = str("[p]\t", "[/p]\n[p]\t".join(arr), "[/p]")

func start_typeout(tween : Tween):
	tween.tween_method(_set_visible_characters, 0, text.length(), text.length() / charactersPerSecond)

func _set_visible_characters(count : int):
	visible_characters = count
