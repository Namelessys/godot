extends Node

@onready var text_label = $Control/MarginContainer/CenterContainer/VSplitContainer/RichTextLabel
@onready var text_input = $Control/MarginContainer/CenterContainer/VSplitContainer/HBoxContainer/LineEdit

func _ready():
	if global_game.leaderboard_pos == 0:
		text_label.text = "[b]New highscore: " + str(int(global_game.current_score)) + "[/b]\n"
	else:
		text_label.text = "[b]New score: " + str(int(global_game.current_score)) + "[/b]\n"
	

func _on_submit_pressed():
	global_game.highscores.insert(global_game.leaderboard_pos, {text_input.text: int(global_game.current_score)})
	#global_game.highscores[10] = null
	if true:
		var save_file = FileAccess.open("user://highscores.dat", FileAccess.WRITE)
		save_file.store_string(JSON.stringify(global_game.highscores))
		save_file = null
	get_tree().change_scene_to_file("res://scenes/Highscores/Highscores.tscn")
