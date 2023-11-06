class_name FadeOverTimeTextEffect
extends RichTextEffect

var bbcode : String = "fade_over_time"

func _process_custom_fx(char_fx : CharFXTransform):
	var startTimeUsec : int = char_fx.env.get("start_time", 0)
	var durationUsec : int = char_fx.env.get("duration", 0)
	char_fx.color.a = clamp((Time.get_ticks_usec() - startTimeUsec) / float(durationUsec), 0.0, 1.0)
