extends Node

var test := 0

func _init(value):
	print("GI init")
	test = value
	
func get_test():
	return test

func set_test(value):
	test = value
	
