extends RigidBody2D

signal supper_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("RigidBody2D: " + str(global_position))
	#supper_signal.emit()
	pass
	
func _physics_process(delta):
	#apply_force(Vector2(1000, 0)) # == self.apply_force()
	pass
	
