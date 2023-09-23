class_name StoryText
extends RichTextLabel

@export var charactersPerSecond : float

func start_typeout(storyText : String, tween : Tween):
	text = storyText
	tween.tween_method(_set_visible_characters, 0, text.length(), text.length() / charactersPerSecond)

func _set_visible_characters(count : int):
	print(count)
	visible_characters = count