extends Node

var stats = status.player

func _ready():
	pass # Replace with function body.


func _process(delta):
	stats.money += stats.moeny_gain * delta
