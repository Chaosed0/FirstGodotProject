class_name AudioHandler
extends Node

@export var storyUi : StoryUI
@export var player : AudioStreamPlayer
@export var leftLabel : RichTextLabel
@export var rightLabel : RichTextLabel
@export var srtFiles : Array[ImportedSRTFile]
@export var audioStreams : Array[AudioStream]

var _currentSrtFile : ImportedSRTFile
var _currentAudioStream : AudioStream
var _currentAudioIndex : int
var _currentSubtitleIndex : int

var _leftNonEffectText : String = ""
var _leftCurrentEffectText : String = ""

var _rightNonEffectText : String = ""
var _rightCurrentEffectText : String = ""

func _ready():
	leftLabel.text = ""
	rightLabel.text = ""
	_currentAudioIndex = 0

	player.finished.connect(on_finished_playing)
	storyUi.begin_audio_signal.connect(play_audio)

func play_audio():
	_currentSubtitleIndex = 0
	_currentSrtFile = srtFiles[_currentAudioIndex]
	_currentAudioStream = audioStreams[_currentAudioIndex]

	player.stream = _currentAudioStream
	player.play(0.0)

func _input(ev):
	if ev is InputEventKey:
		var t_ev : InputEventKey = ev

		print(t_ev)
		if t_ev.keycode == KEY_HOME && !t_ev.echo && t_ev.pressed:
			player.stop()
			on_finished_playing()

func _process(_delta):
	if _currentSrtFile == null || _currentAudioStream == null:
		return

	var time : float = player.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	time = max(0, time)

	if _currentSubtitleIndex >= _currentSrtFile.starts.size():
		return

	var nextStart = _currentSrtFile.starts[_currentSubtitleIndex]

	if time * 1000.0 > nextStart:
		var newText : String = _currentSrtFile.texts[_currentSubtitleIndex]

		if _currentAudioIndex % 2 == 0:
			_leftNonEffectText = str(_leftNonEffectText, " ", _leftCurrentEffectText)
			_leftCurrentEffectText = newText

			leftLabel.text = (str(_leftNonEffectText, " [fade_over_time start_time=%s duration=%s]" % [Time.get_ticks_usec(), 500000], newText, "[/fade_over_time]"))

		else:
			_rightNonEffectText = str(_rightNonEffectText, " ", _rightCurrentEffectText)
			_rightCurrentEffectText = newText

			rightLabel.text = (str(_rightNonEffectText, " [fade_over_time start_time=%s duration=%s]" % [Time.get_ticks_usec(), 500000], newText, "[/fade_over_time]"))

		_currentSubtitleIndex = _currentSubtitleIndex + 1

func on_finished_playing():
	await get_tree().create_timer(1.0).timeout
	_currentAudioIndex = (_currentAudioIndex + 1) % srtFiles.size()

	if _currentAudioIndex % 2 == 0:
		_leftNonEffectText = str(_leftNonEffectText, " ", _leftCurrentEffectText)
		_leftCurrentEffectText = ""

		if !_leftNonEffectText.is_empty():
			_leftNonEffectText += "\n\n"
	else:
		_rightNonEffectText = str(_rightNonEffectText, " ", _rightCurrentEffectText)
		_rightCurrentEffectText = ""

		if !_rightNonEffectText.is_empty():
			_rightNonEffectText += "\n\n"

	play_audio()
