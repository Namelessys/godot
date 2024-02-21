extends Node2D

@onready var rigid_body = $RigidBody2D

@export var health : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#rigid_body = $RigidBody2D # == rigid_body = find_child("RigidBody2D")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(global_position)
	#print(health)
	pass


func _on_rigid_body_2d_mouse_entered():
	rigid_body.apply_impulse(Vector2(0, -1000))
	pass # Replace with function body.
