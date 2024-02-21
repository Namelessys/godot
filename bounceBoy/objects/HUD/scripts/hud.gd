extends Node

@onready var text_label = $MarginContainer/RichTextLabel

func _process(delta):
	text_label.text = "Time: " + str(int(global_game.current_score))
