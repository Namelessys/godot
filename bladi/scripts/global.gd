extends Node

var foo = "faa"

var toggle = false

func _ready():
	toggle = !toggle
	if toggle:
		print("Make mouse ocked")
	else:
		print("Make mouse unocked")

func example():
	print("I bims a global func")
