class_name StoryChoice
extends Control

@export var delay_time : float = 0.1
@export var fade_in_time : float = 0.25
@export var shift_amount : float = 20
@export var button : Button
@export var label : RichTextLabel
@export var horizontal_spacer : Control

var _index : int

signal on_choice_chosen(index : int)

func _ready():
	button.pressed.connect(on_pressed)

func initialize(choiceText : String, index : int, tween : Tween):
	_index = index
	self.modulate.a = 0

	label.text = choiceText
	button.disabled = true
	horizontal_spacer.custom_minimum_size = Vector2(shift_amount, 0)

	tween.tween_interval(delay_time * index)
	tween.chain().tween_callback(self.set_enabled)
	tween.tween_property(horizontal_spacer, "custom_minimum_size", Vector2(0,0), fade_in_time)
	tween.tween_property(self, "modulate:a", 1, fade_in_time)

func on_pressed():
	on_choice_chosen.emit(_index)

func set_enabled():
	button.disabled = false
