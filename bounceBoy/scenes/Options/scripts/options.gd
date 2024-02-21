extends Node

@onready var fov = $Control/MarginContainer/VBoxContainer/FoV
@onready var sound = $Control/MarginContainer/VBoxContainer/Sound

@onready var audio_stream = $AudioStreamPlayer2D

func save_options():
	if true:
		var option_file = FileAccess.open("user://options.dat", FileAccess.WRITE)
		option_file.store_string(JSON.stringify(global_game.options))
		option_file = null

func _ready():
	fov.set_value(global_game.options.fov)
	sound.set_value(global_game.options.sound)

func _on_zoom_value_changed(value):
	global_game.options.fov = value
	save_options()
	
func _on_sound_value_changed(value):
	audio_stream.stream = preload("res://audio/boing/boing1.ogg")
	audio_stream.set_volume_db(linear_to_db(value / 50))
	audio_stream.play()
	global_game.options.sound = value
	save_options()

func _on_button_back_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu/MainMenu.tscn")

