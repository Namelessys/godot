extends Button

const UNIT = preload("res://objects/Unit_Human.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_up():
	var unit = UNIT.instantiate()
	var unit2 = UNIT.instantiate()
	unit.position = Vector2(88, 88)
	unit2.position = Vector2(546, 88)
	unit2.is_enemy = true
	get_tree().root.add_child(unit, true)
	get_tree().root.add_child(unit2, true)
