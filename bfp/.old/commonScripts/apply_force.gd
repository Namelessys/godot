extends Node

var pushForce = 100
@onready var body = get_node("..")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for i in body.get_slide_collision_count():
		var col = body.get_slide_collision(i)
		#print(col.get_collider())
		if col.get_collider() is RigidBody2D:
			pass
			#print(col.get_normal())
			#print(col.get_normal() * 2)
			col.get_collider().apply_central_force(Vector2(100, 0))
	
