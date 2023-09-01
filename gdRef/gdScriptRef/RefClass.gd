class_name RefClass

var nonStaticVar := 0

static var staticVar = 0:
	get:
		return staticVar

func _init():
	staticVar += 1
	nonStaticVar += 1


