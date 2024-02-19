extends Node

@export var UNIT : PackedScene

@onready var sub_viewport = $SubViewport
@onready var panel = $Panel
@onready var button = $Button

var unit

# Called when the node enters the scene tree for the first time.
func _ready():
	button.tooltip_text = self.tooltip_text
	
	unit = UNIT.instantiate()
	unit.position = Vector2(512, 512)
	if "torque_factor" in unit:
		unit.torque_factor = 0
	if "speed_factor" in unit:
		unit.speed_factor = 0
	sub_viewport.add_child(unit)


func _on_button_pressed():
	if "spawn_wiggle" in unit:
		unit.spawn_wiggle()
		
	print("SPAWN")

