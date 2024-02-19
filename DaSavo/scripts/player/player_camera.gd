extends Node

@onready var player = get_parent()

func _process(delta):
	var horizontal_direction = Input.get_axis("camera_left", "camera_right") 
	var vertical_direction = Input.get_axis("camera_up", "camera_down") 
	player.move_local_x(horizontal_direction * config.camera_speed * delta)
	player.move_local_y(vertical_direction * config.camera_speed * delta)
	
