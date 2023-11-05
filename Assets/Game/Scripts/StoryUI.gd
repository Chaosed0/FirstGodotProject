class_name StoryUI
extends Control

@export var story : InkStory
@export var textScene : PackedScene
@export var choiceScene : PackedScene
@export var separator : PackedScene
@export var bottomSpacer : Control
@export var scrollContainer : ScrollContainer
@export var content : MarginContainer
@export var container : VBoxContainer

var _margin : float
var _currentTween : Tween
var _currentChoices : Array[StoryChoice]
var _currentStoryText : RichTextLabel

signal on_story_complete(story : InkStory)

func _ready():
	modulate.a = 0
	_margin = content.get_theme_constant("margin_top") + content.get_theme_constant("margin_bottom") + 10

func load_story(knot: String):
	modulate.a = 1

	if _currentTween != null:
		skip_tween()

	for child in container.get_children():
		if child != bottomSpacer:
			child.queue_free()

	if knot != null:
		story.ChoosePathString(knot)

	continue_story(true);

func continue_story(is_first : bool):
	var text : String = story.ContinueMaximally()

	if text.is_empty() && story.GetCurrentChoices().size() == 0:
		complete_story()
		return

	if _currentTween != null:
		skip_tween()

	var newSeparator : Control

	if !is_first:
		newSeparator = separator.instantiate()
		container.add_child(newSeparator)

	if !text.is_empty():
		_currentStoryText = textScene.instantiate()
		_currentStoryText.set_story_text(text)
		container.add_child(_currentStoryText)

	for choice in story.GetCurrentChoices():
		var button : StoryChoice = choiceScene.instantiate()
		button.initialize(choice.GetText(), choice.GetIndex())

		button.on_choice_chosen.connect(on_choice_pressed)
		_currentChoices.append(button)
		container.add_child(button);

	container.move_child(bottomSpacer, container.get_child_count())
	await get_tree().process_frame
	
	_currentTween = get_tree().create_tween()
	_currentTween.set_parallel()
	_currentTween.finished.connect(on_tween_finished)

	var additionalSize : float = 0

	if _currentStoryText != null:
		additionalSize += _currentStoryText.size.y

	for button in _currentChoices:
		additionalSize += button.size.y

	bottomSpacer.custom_minimum_size = Vector2(0, scrollContainer.size.y - additionalSize - _margin)

	if !is_first:
		_currentTween.tween_property(scrollContainer, "scroll_vertical", newSeparator.position.y, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	else:
		scrollContainer.scroll_vertical = 0

	if _currentStoryText != null:
		_currentStoryText.start_typeout(_currentTween)
		_currentTween.chain()

	for button in _currentChoices:
		button.initialize_tween(_currentTween)

	_currentTween.play()

func skip_tween():
	if _currentTween != null:
		_currentTween.custom_step(99999)

func on_choice_pressed(index : int):
	story.ChooseChoiceIndex(index);

	for choice in _currentChoices:
		choice.queue_free()

	_currentChoices.clear()
	continue_story(false)

func complete_story():
	modulate.a = 0
	on_story_complete.emit(story)

func on_tween_finished():
	_currentTween = null

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		skip_tween()
		return
