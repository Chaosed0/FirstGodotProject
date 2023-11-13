class_name FadeOverTimeTextEffect
extends RichTextEffect

var bbcode : String = "fade_over_time"

var _isDone = false

func _process_custom_fx(char_fx : CharFXTransform):
	var startTimeUsec : int = char_fx.env.get("start_time", 0)
	var durationUsec : int = char_fx.env.get("duration", 0)
	var lerpVal : float = (Time.get_ticks_usec() - startTimeUsec) / float(durationUsec)

	if lerpVal < 1:
		char_fx.color.a = clamp(lerpVal, 0.0, 1.0)
	elif !_isDone:
		char_fx.color.a = 1
		_isDone = true
