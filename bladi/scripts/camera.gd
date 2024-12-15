extends Camera3D

var shot = false

@export_enum("test", "test2", "test3") var exportet

const VALUES = [1.1, 2.2, 3.3]

func test():
	print(rotation.x)
	rotate_object_local(Vector3(1, 0, 0), .1)
	print(rotation.x)

# Called when the node enters the scene tree for the first time.
func _ready():
	print(VALUES[exportet])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not shot:
		test()
		shot = true
