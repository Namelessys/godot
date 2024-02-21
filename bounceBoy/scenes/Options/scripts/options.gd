extends Node

@onready var fov = $Control/MarginContainer/VBoxContainer/FoV

func save_options():
	if true:
		var option_file = FileAccess.open("user://options.dat", FileAccess.WRITE)
		option_file.store_string(JSON.stringify(global_game.options))
		option_file = null

func _ready():
	fov.set_value(global_game.options.fov)

func _on_zoom_value_changed(value):
	global_game.options.fov = value
	save_options()

func _on_button_back_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu/MainMenu.tscn")
