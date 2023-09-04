extends Node2D

var b_even_frame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_position(Vector2(15, 0))
	$Area2D.set_position(Vector2(15, 0))
	
	print($Area2D.has_overlapping_areas())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#set_position(Vector2(15, 0))
	
	
	
	#$Area2D.set_position(Vector2(0, 0))
	set_position(Vector2(0, 0))
	
	b_even_frame = !b_even_frame
	pass

func _physics_process(_delta):
	#set_position(Vector2(15, 0))
	pass

func _on_area_2d_area_entered(area):
	print("Entered")
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	print("Exited")
	pass # Replace with function body.
