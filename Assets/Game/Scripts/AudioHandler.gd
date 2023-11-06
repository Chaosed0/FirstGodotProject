class_name AudioHandler
extends Node

@export var player : AudioStreamPlayer
@export var leftLabel : RichTextLabel
@export var rightLabel : RichTextLabel
@export var srtFiles : Array[ImportedSRTFile]
@export var audioStreams : Array[AudioStream]

var _currentSrtFile : ImportedSRTFile
var _currentAudioStream : AudioStream
var _currentAudioIndex : int
var _currentSubtitleIndex : int

func _ready():
	leftLabel.text = ""
	rightLabel.text = ""
	_currentAudioIndex = 0
	player.finished.connect(on_finished_playing)

	play_audio()

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
	var label : RichTextLabel = get_current_label()
	var time : float = player.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	time = max(0, time)

	if _currentSubtitleIndex >= _currentSrtFile.starts.size():
		return

	var nextStart = _currentSrtFile.starts[_currentSubtitleIndex]

	if time * 1000.0 > nextStart:
		var newText : String = _currentSrtFile.texts[_currentSubtitleIndex]

		if !label.text.is_empty():
			label.text += " "

		label.text += str("[fade_over_time start_time=%s duration=%s]" % [Time.get_ticks_usec(), 500000], newText, "[/fade_over_time]")

		_currentSubtitleIndex = _currentSubtitleIndex + 1

func on_finished_playing():
	await get_tree().create_timer(1.0).timeout
	_currentAudioIndex = (_currentAudioIndex + 1) % srtFiles.size()
	var label : RichTextLabel = get_current_label()

	if !label.text.is_empty():
		label.text = "\n"

	play_audio()

func get_current_label() -> RichTextLabel:
	return leftLabel if _currentAudioIndex % 2 == 0 else rightLabel
