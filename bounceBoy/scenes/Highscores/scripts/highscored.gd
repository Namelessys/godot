extends Node

@onready var text_label = $Control/MarginContainer/RichTextLabel

func _process(delta):
	var highscores_string = "[center]"
	
	for highscore in global_game.highscores:
		if highscore != null:
			var name = highscore.keys()[0]
			highscores_string += "[b]" + name + ": [/b]" + str(highscore[name]) + "\n"
	
	highscores_string += "[/center]"
	text_label.text = highscores_string

func _on_button_press(new_state):
	if new_state == "play":
		get_tree().change_scene_to_file("res://scenes/Game/Game.tscn")
	if new_state == "main_menu":
		get_tree().change_scene_to_file("res://scenes/MainMenu/MainMenu.tscn")
