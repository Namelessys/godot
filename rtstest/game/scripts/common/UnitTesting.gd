extends Node

@onready var unit_container = get_parent().find_child("UnitContainer")
@export var unit: PackedScene

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#Engine.max_fps = -1
	#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	
	for i in range(10):
		var unit1 = unit.instantiate()
		var unit2 = unit.instantiate()
		unit1.affiliation = 1
		unit2.affiliation = 2
		
		unit1.position.x = (rng.randf() - .5) * 10
		unit1.position.z = (rng.randf() - .5) * 10
		unit2.position.x = (rng.randf() - .5) * 10
		unit2.position.z = (rng.randf() - .5) * 10
		
		unit_container.add_child(unit1)
		unit_container.add_child(unit2)
		
		
	pass
	
func _process(delta):
	pass
