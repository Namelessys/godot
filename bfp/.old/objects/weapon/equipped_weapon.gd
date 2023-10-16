extends Node2D

@onready var rigidbody = $RigidBody2D

var attached = true

func _process(delta):
	if attached:
		look_at(get_global_mouse_position())
		
	pass
