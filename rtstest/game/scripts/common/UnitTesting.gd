extends Node

@onready var unit_container = $"../Units"
@onready var dummy_path = "res://game/tscns/units/Dummy.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	#Engine.max_fps = -1
	#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	
	for i in range(0):
		unit_container.add_child(load(dummy_path).instantiate())
		
	pass
	
func _process(delta):
	pass
