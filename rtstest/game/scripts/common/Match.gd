extends Node3D

@onready var unit_container = find_child("UnitContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_unit(player, unit, position):
	var new_unit = load(unit).instantiate()
	new_unit.position = position
	new_unit.affiliation = 2
	unit_container.add_child(new_unit)
	
