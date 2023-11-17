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
@export var debug : bool

var _margin : float
var _currentTween : Tween
var _currentChoices : Array[StoryChoice]
var _currentStoryText : RichTextLabel

var _didBeginAudio : bool
var _deferredBeginAudio : bool
var _randomizeNextChoices : bool

signal begin_audio_signal
signal on_story_tween_begin
signal on_story_tween_complete
signal on_story_complete(story : InkStory)

func _ready():
	clip_contents = false
	mouse_filter = Control.MOUSE_FILTER_PASS

	modulate.a = 0
	_margin = content.get_theme_constant("margin_top") + content.get_theme_constant("margin_bottom") + 10

	var randomizeNextCallable = Callable(self, "randomize_next_choices")
	var beginAudioCallable = Callable(self, "begin_audio")
	story.BindExternalFunction("shuffle_next_choices", randomizeNextCallable)
	story.BindExternalFunction("begin_audio", beginAudioCallable)

func load_story(knot: String):
	modulate.a = 1

	if _currentTween != null:
		skip_tween()

	for child in container.get_children():
		if child != bottomSpacer:
			child.queue_free()

	if knot != null:
		story.ChoosePathString(knot)

	story.StoreVariable("debug", debug)

	continue_story(true);

func continue_story(is_first : bool):
	if !story.GetCanContinue():
		complete_story()
		return

	var nilHandler = story.ContinueMaximally()

	if nilHandler == null:
		complete_story()
		return

	var text : String = nilHandler

	if text.is_empty() && story.GetCurrentChoices().size() == 0:
		complete_story()
		return

	var tags : Array = story.GetCurrentTags()

	for tag in tags:
		print("TAG:", tag)

		if tag.begins_with("LINK:"):
			var link_address : String = tag.substr(5).strip_edges()
			OS.shell_open(link_address)

	if _currentTween != null:
		skip_tween()

	on_story_tween_begin.emit()

	var newSeparator : Control

	if !is_first:
		newSeparator = separator.instantiate()
		container.add_child(newSeparator)

	if !text.is_empty():
		_currentStoryText = textScene.instantiate()
		_currentStoryText.set_story_text(text)
		container.add_child(_currentStoryText)

	var choices = story.GetCurrentChoices()
	var indexes = range(choices.size())

	if _randomizeNextChoices:
		indexes.shuffle()
		_randomizeNextChoices = false

	_currentChoices.clear()

	for index in indexes:
		var choice = choices[index]
		var button : StoryChoice = choiceScene.instantiate()
		button.initialize(choice.GetText(), choice.GetIndex())

		button.on_choice_chosen.connect(on_choice_pressed)
		_currentChoices.append(button)
		container.add_child(button);

	container.move_child(bottomSpacer, container.get_child_count())
	await get_tree().process_frame
	
	_currentTween = self.create_tween()
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
		_currentTween.chain().tween_callback(Callable(self, "on_tween_complete"))

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
	on_story_complete.emit(story)

func on_tween_finished():
	_currentTween = null

func randomize_next_choices():
	_randomizeNextChoices = true

func begin_audio():
	if !_didBeginAudio:
		_deferredBeginAudio = true

func on_tween_complete():
	on_story_tween_complete.emit()

	if _deferredBeginAudio:
		begin_audio_signal.emit()
		_deferredBeginAudio = false
		_didBeginAudio = true

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		skip_tween()
		accept_event()
