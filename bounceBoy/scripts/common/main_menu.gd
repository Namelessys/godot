extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var version_number = find_child("VersionNumber", true)
	if version_number != null:
		version_number.text = str("[right]v" + global_game.VERSION + "[/right]")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_press(new_state):
	if new_state == "play":
		get_tree().change_scene_to_file("res://scenes/Game/Game.tscn")
	if new_state == "highscores":
		get_tree().change_scene_to_file("res://scenes/Highscores/Highscores.tscn")
	if new_state == "credits":
		get_tree().change_scene_to_file("res://scenes/Credits/Credits.tscn")
	if new_state == "main_menu":
		get_tree().change_scene_to_file("res://scenes/MainMenu/MainMenu.tscn")
	if new_state == "options":
		get_tree().change_scene_to_file("res://scenes/Options/Options.tscn")
	if new_state == "quit":
		get_tree().quit()
