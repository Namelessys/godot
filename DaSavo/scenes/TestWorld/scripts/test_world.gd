extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	game.world = self.find_child("World")
