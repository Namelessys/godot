extends Node

@onready var units = $"../Units"

func _ready():
	# Pause the game initially
	print("Game is paused. Press SPACE to advance a frame.")

func _process(delta):
	units.is_paused = false
	if Input.is_action_pressed("ui_right"):
		units.is_paused = false	

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("T")
		units.is_paused = false
	
	
	#if event.is_action_pressed("ui_accept"):  # Default action for SPACE
		
