extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Main.editor_entered.connect(_test)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(Main.game_state)
	pass

func _test():
	#print("TEST")
	pass
