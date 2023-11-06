@tool
class_name SRTImportPlugin
extends EditorImportPlugin

enum State
{
	INDEX,
	TIME,
	SUBTITLE
}

func _get_importer_name():
	return "net.straypixels.srtimporter"

func _get_visible_name():
	return "SRT File"

func _get_recognized_extensions():
	return ["srt"]

func _get_save_extension():
	return "res"

func _get_resource_type():
	return "Resource"

func _get_preset_count():
	return 0

func _get_preset_name(preset_index : int):
	return "UNKNOWN"

func _get_import_options(path : String, preset_index : int):
	return []

func _get_option_visibility(path: String, option_name: StringName, options : Dictionary) -> bool:
	return true

func _get_priority() -> float:
	return 2.0

func _get_import_order() -> int:
	return 0

func _import(source_file : String, save_path : String, options, r_platform_variants, r_gen_files):
	var file = FileAccess.open(source_file, FileAccess.READ)

	if file == null:
		return FileAccess.get_open_error()

	print(file)

	var state : State = State.INDEX
	var start : int
	var end : int
	var text : String
	var importResult : ImportedSRTFile = ImportedSRTFile.new()

	while !file.eof_reached():
		var line : String = file.get_line()

		if line.is_empty():
			if state == State.SUBTITLE:
				importResult.starts.append(start)
				importResult.ends.append(end)
				importResult.texts.append(text)

				start = 0
				end = 0
				text = ""

				state = State.INDEX

			continue

		if state == State.INDEX:
			if line.is_valid_int():
				assert(int(line) == importResult.texts.size() + 1)
				state = State.TIME
		elif state == State.TIME:
			var splitTime : PackedStringArray = line.split(' ')
			
			assert(splitTime.size() == 3)
			assert(splitTime[1] == "-->")
			start = get_msec(splitTime[0])
			end = get_msec(splitTime[2])

			state = State.SUBTITLE
		elif state == State.SUBTITLE:
			if !text.is_empty():
				text += "\n"

			text += line

	return ResourceSaver.save(importResult, "%s.%s" % [save_path, _get_save_extension()])

func get_msec(timestamp : String) -> int:
	var splitTime : PackedStringArray = timestamp.split(":")
	assert(splitTime.size() == 3)

	var splitSeconds : PackedStringArray = splitTime[2].split(",")
	assert(splitSeconds.size() == 2)

	var msec : int = 0

	msec += int(splitSeconds[1])
	msec += int(splitSeconds[0]) * 1000
	msec += int(splitTime[1]) * 60 * 1000
	msec += int(splitTime[0]) * 60 * 60 * 1000

	return msec
