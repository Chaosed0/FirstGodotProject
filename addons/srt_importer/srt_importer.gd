@tool
extends EditorPlugin

var import_plugin

func _enter_tree():
	import_plugin = SRTImportPlugin.new()
	add_import_plugin(import_plugin)
	pass


func _exit_tree():
	remove_import_plugin(import_plugin)
	import_plugin = null
	pass
