@tool
extends EditorPlugin

#var exec_output = []
var exec_last_return = 0

func exec(path):
	#OS.execute("editor/bash/set_windows_pos.sh", [])
	var exec_output = []
	exec_last_return = OS.execute(path, [], exec_output, true)
	print("EXEC: '", path, "': ", str(exec_last_return), ": \n", exec_output[0])
	print()

func _build():
	#if DebugConf.debug_noname:
	#	return 
	print("Execute pre-building steps")
	exec("shell/noname/build_test_env.sh")
	return true

func _clear():
	print("TTTTTTTTTTTTTTTTTT")
	
