class_name StoryUI
extends Control

@export var textScene : PackedScene
@export var choiceScene : PackedScene
@export var separator : PackedScene
@export var container : VBoxContainer

var _story : InkStory
var _currentTween : Tween
var _currentChoices : Array[StoryChoice]

signal on_story_complete(story : InkStory)

func _ready():
	modulate.a = 0

func load_story(new_story : InkStory):
	print("load story %s" % new_story)
	modulate.a = 1

	if _currentTween != null:
		skip_tween()

	for child in container.get_children():
		child.queue_free()

	_story = new_story
	continue_story();

func continue_story():
	var text : String = _story.ContinueMaximally()

	if text.is_empty() && _story.GetCurrentChoices().size() == 0:
		print("complete")
		complete_story()
		return

	if _currentTween != null:
		skip_tween()
	
	_currentTween = get_tree().create_tween()
	_currentTween.set_parallel()
	_currentTween.finished.connect(on_tween_finished)

	if !text.is_empty():
		var storyText : StoryText = textScene.instantiate()
		storyText.start_typeout(text, _currentTween)
		container.add_child(storyText)

		_currentTween.chain()

	for choice in _story.GetCurrentChoices():
		var button : StoryChoice = choiceScene.instantiate()
		button.initialize(choice.GetText(), choice.GetIndex(), _currentTween)

		button.on_choice_chosen.connect(on_choice_pressed)
		_currentChoices.append(button)
		container.add_child(button);

	_currentTween.play()

func skip_tween():
	if _currentTween != null:
		_currentTween.custom_step(99999)

func on_choice_pressed(index : int):
	_story.ChooseChoiceIndex(index);

	for choice in _currentChoices:
		choice.queue_free()

	var newSeparator = separator.instantiate()
	container.add_child(newSeparator)

	_currentChoices.clear()
	continue_story()

func complete_story():
	modulate.a = 0
	on_story_complete.emit(_story)

func on_tween_finished():
	_currentTween = null

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		skip_tween()
		print("I've been clicked D:")
		return
