extends Node

var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_paused:
		var x
		for unit in self.get_children():
			print(unit)
			print(unit.push_forces)
			unit.global_position += unit.push_forces
			unit.push_forces = Vector3(0, 0, 0)
			#print(unit)
		
