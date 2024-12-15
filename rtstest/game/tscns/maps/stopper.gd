extends Node

var is_paused: bool = true

func _ready():
	# Pause the game initially
	#get_tree().paused = true
	print("Game is paused. Press SPACE to advance a frame.")

func _input(event):
	print("T")
	# Check for key press to advance frame
	if event.is_action_pressed("ui_accept"):  # Default action for SPACE
		if is_paused:
			step_frame()

	# Toggle pause with another button (e.g., P)
	if event.is_action_pressed("ui_cancel"):  # Default action for ESC
		toggle_pause()

func step_frame():
	# Process one frame in idle and physics
	print("Advancing one frame...")
	get_tree().idle_frame()  # Process idle (e.g., _process)
	get_tree().fixed_frame()  # Process physics (e.g., _physics_process)

func toggle_pause():
	# Toggle pause state
	is_paused = not is_paused
	get_tree().paused = is_paused
	print("Game paused: ", is_paused)
