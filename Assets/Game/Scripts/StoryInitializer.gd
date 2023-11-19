class_name StoryInitializer
extends Node

@export var _storyUI : StoryUI
@export var knot_path : String
@export var skip_knot_path : String
@export var skipButton : Button
@export var skipTime : float

var _skipTimer : Timer

func _ready():
	_storyUI.load_story(knot_path)

	_storyUI.on_story_tween_begin.connect(on_story_tween_begin)
	_storyUI.on_story_tween_complete.connect(on_story_tween_complete)
	_storyUI.on_story_complete.connect(on_story_complete)
	_storyUI.on_story_loaded_signal.connect(on_story_loaded)

	_skipTimer = Timer.new()
	_skipTimer.autostart = false
	_skipTimer.timeout.connect(on_skip_timer_finished)
	add_child(_skipTimer)

	skipButton.visible = false
	skipButton.disabled = true
	skipButton.button_up.connect(on_skip)

func on_story_loaded():
	_storyUI.story.bind_external_function("quit_game", self, "quit")

func on_skip():
	_storyUI.load_story(skip_knot_path)
	skipButton.visible = false
	skipButton.disabled = true

func on_story_tween_begin():
	_skipTimer.stop()
	skipButton.visible = false
	skipButton.disabled = true

func on_story_tween_complete():
	if _storyUI.story.get_variable("skip_allowed"):
		_skipTimer.start(skipTime)

func on_story_complete(_story : InkPlayer):
	_skipTimer.stop()
	skipButton.visible = false
	skipButton.disabled = true

func quit():
	get_tree().quit()

func on_skip_timer_finished():
	skipButton.visible = true
	skipButton.disabled = false
