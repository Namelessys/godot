extends Node

@export var UNIT : PackedScene
@export var id = 0

@onready var sub_viewport = $SubViewport
@onready var button = $Button
@onready var sub_viewport_camera = $SubViewport/SubViewportCamera

var unit

# Called when the node enters the scene tree for the first time.
func _ready():
	sub_viewport_camera.position = Vector3(999 + id * 1000, 2, -2.036)
	set_unit(UNIT)

func _on_button_pressed():
	if "spawn_wiggle" in unit:
		unit.spawn_wiggle()
		
	print("SPAWN")
	
func set_unit(new_unit):
	if new_unit == null:
		print("WARN: No unit selected.")
		return
	button.tooltip_text = self.tooltip_text
	
	unit = new_unit.instantiate()
	unit.is_in_preview = true
	unit.position = Vector3(1000 + id * 1000, 0, 0)
	if "torque_factor" in unit:
		unit.torque_factor = 0
	if "speed_factor" in unit:
		unit.speed_factor = 0
	sub_viewport.add_child(unit)
	
