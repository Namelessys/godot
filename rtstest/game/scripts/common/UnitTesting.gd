extends Node

@onready var dummy = get_parent().find_child("Dummy")
@onready var test_unit = get_parent().find_child("TestUnit")

# Called when the node enters the scene tree for the first time.
func _ready():
	test_unit.set_current_target(dummy)
		
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
