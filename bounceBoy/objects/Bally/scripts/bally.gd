extends RigidBody2D

@export var vertical_force_factor : float = 700
@export var horizontal_force_factor : float = 10
@export var radius : float = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(global_position)
	#print(get_global_mouse_position())
	pass

func _draw():
	#draw_circle(global_position, radius, 0xff3355)
	pass


func _on_mouse_entered():
	var horizontal_force = (get_global_mouse_position().x - global_position.x) * horizontal_force_factor
	apply_impulse(Vector2(-horizontal_force, -vertical_force_factor), get_global_mouse_position())

