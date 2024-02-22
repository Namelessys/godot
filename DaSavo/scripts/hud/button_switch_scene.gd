extends Node

@export var scene : PackedScene
@export var text = ""

@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready():
	button.set_text(text)

func _on_button_pressed():
	print(scene)
	get_tree().change_scene_to_packed(scene)
