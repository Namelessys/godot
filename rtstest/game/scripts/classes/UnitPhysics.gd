extends Node

var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_paused:
		var units = self.get_children()
		var unit_count = units.size()
		var itteration = 0
		for unit in units:
			itteration += 1
			for i in range(unit_count - itteration):
				var other = units[itteration + i]
				if unit.global_position.distance_to(other.position) - (unit.radius + other.radius) <= 0:
					unit.colliding_units.append(other)
					other.colliding_units.append(unit)
				if unit.global_position.distance_to(other.position) - (unit.attention_radius + unit.radius + other.radius) <= 0:
					unit.perceivable_units.append(other)
					other.perceivable_units.append(unit)
		
		
		for unit in units:
			unit.calc_physics(delta)
		
		
		for unit in self.get_children():
			unit.colliding_units = []
			unit.global_position += unit.push_forces * delta
			unit.push_forces = Vector3(0, 0, 0)
