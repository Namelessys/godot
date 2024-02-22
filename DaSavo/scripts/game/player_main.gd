extends Node

@onready var camera_controller = $CameraController

func _ready():
	$Camera2D.make_current()
	pass


func _process(delta):
	pass
