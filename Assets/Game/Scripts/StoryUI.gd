class_name StoryUI
extends Control

@export var story : InkPlayer
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

var _storyIsLoaded : bool
var _deferredKnot : String
var _didBeginAudio : bool
var _deferredBeginAudio : bool
var _randomizeNextChoices : bool

signal begin_audio_signal
signal on_story_loaded_signal
signal on_story_tween_begin
signal on_story_tween_complete
signal on_story_complete(story : InkPlayer)

func _ready():
	print("StoryUI readying")
	clip_contents = false
	mouse_filter = Control.MOUSE_FILTER_PASS

	_margin = content.get_theme_constant("margin_top") + content.get_theme_constant("margin_bottom") + 10

	_storyIsLoaded = false
	story.loaded.connect(on_story_loaded)
	story.create_story()

	for child in container.get_children():
		if child != bottomSpacer:
			child.queue_free()

func load_story(knot: String):
	if !_storyIsLoaded:
		print("Deferred knot set to ", knot)
		_deferredKnot = knot
	else:
		print("Directly loading knot ", knot)
		load_story_internal(knot)

func on_story_loaded(successfully: bool):
	_storyIsLoaded = successfully

	if !successfully:
		print("Story was not loaded successfully!")
	else:
		print("Story loaded successfully!")

	story.bind_external_function("shuffle_next_choices", self, "randomize_next_choices")
	story.bind_external_function("begin_audio", self, "begin_audio")

	on_story_loaded_signal.emit()

	if _deferredKnot != null:
		load_story_internal(_deferredKnot)

func load_story_internal(knot: String):
	if _currentTween != null:
		skip_tween()

	for child in container.get_children():
		if child != bottomSpacer:
			child.queue_free()

	if knot != null:
		story.choose_path(knot)

	story.set_variable("debug", debug)

	continue_story(true);

func continue_story(is_first : bool):
	var text : String = ""

	while story.can_continue:
		text += story.continue_story()

	var tags : Array = story.current_tags

	for tag in tags:
		print(tag)
		if tag.begins_with("LINK:"):
			var link_address : String = tag.substr(5).strip_edges()
			print("LINK ", link_address)
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

	var choices : Array = story.current_choices
	var indexes = range(choices.size())

	if _randomizeNextChoices:
		indexes.shuffle()
		_randomizeNextChoices = false

	_currentChoices.clear()

	var i : int = 0

	for index in indexes:
		var choice : InkChoice = choices[index]
		var button : StoryChoice = choiceScene.instantiate()
		button.initialize(choice.text, choice.index, i)

		button.on_choice_chosen.connect(on_choice_pressed)
		_currentChoices.append(button)
		container.add_child(button);
		i = i + 1

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

	if !story.has_choices:
		_currentTween.chain().tween_callback(self.complete_story)

	for button in _currentChoices:
		button.initialize_tween(_currentTween)

	_currentTween.play()

func skip_tween():
	if _currentTween != null:
		_currentTween.custom_step(99999)

func on_choice_pressed(index : int):
	story.choose_choice_index(index);

	for choice in _currentChoices:
		choice.queue_free()

	_currentChoices.clear()
	continue_story(false)

func complete_story():
	print("story is completed")
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
