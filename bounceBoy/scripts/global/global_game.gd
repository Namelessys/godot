extends Node

const VERSION = "0.2"
const FOV_BASE_VALUE = 2

var highscores = []
var current_score = 1
var leaderboard_pos = 0

var options = {}

func _ready():
	var highscore_file = FileAccess.open("user://highscores.dat", FileAccess.READ)
	if highscore_file != null:
		var json = JSON.new()
		highscores = json.parse_string(highscore_file.get_as_text())
	else:
		highscores.append({"MeMyself": 1})
	
	var option_file = FileAccess.open("user://options.dat", FileAccess.READ)
	if option_file != null:
		var json = JSON.new()
		options = json.parse_string(option_file.get_as_text())
	else:
		options = {"fov": 1, "sound": 50, "music": 50}
	


