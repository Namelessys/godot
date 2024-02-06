extends Button

@export var UNIT : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_up(enemy):
	var unit = UNIT.instantiate()
	if not enemy:
		unit.position = Vector2(88, 88)
	else:
		unit.position = Vector2(546, 88)
		unit.is_enemy = true
		
	get_tree().root.add_child(unit, true)
