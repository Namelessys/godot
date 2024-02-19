extends Node

@onready var camera_controller = $CameraController

var stats = player_status

func _ready():
	$Camera2D.make_current()
	pass


func _process(delta):
	stats.money += stats.moeny_gain * delta
	pass
