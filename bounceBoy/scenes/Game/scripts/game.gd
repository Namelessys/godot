extends Node

@onready var camera = $Camera2D
@onready var dead_zone = $DeadZone

func _ready():
	global_game.current_score = 1
	print("FoV: " + str(global_game.options.fov))
	camera.zoom = Vector2(global_game.FOV_BASE_VALUE - global_game.options.fov / 60, global_game.FOV_BASE_VALUE - global_game.options.fov / 60)
	
	dead_zone.position.y = camera.get_viewport().size.y / 2 / camera.zoom.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_game.current_score += delta


func _on_area_2d_area_entered(area):
	global_game.leaderboard_pos = -1
	for highscore in global_game.highscores:
		global_game.leaderboard_pos += 1
		if highscore != null:
			var name = highscore.keys()[0]
			var score = highscore[name]	
			if global_game.current_score > score:
				get_tree().change_scene_to_file("res://scenes/NewHighscore/NewHighscore.tscn")
				return
