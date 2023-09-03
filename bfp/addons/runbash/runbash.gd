@tool
extends EditorPlugin

var exec_output = []
var exec_last_return = 0

func exec(path):
	#OS.execute("editor/bash/set_windows_pos.sh", [])
	exec_last_return = OS.execute(path, [], exec_output)
	print("EXEC: '", path, "': ", str(exec_last_return), ": ", exec_output[0])
	exec_output[0] = null

func _build():
	print("Execute pre-building steps")
	exec("shell/set_window_pos.sh")
	return true

func _enter_tree():
	# Initialization of the plugin goes here.
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
