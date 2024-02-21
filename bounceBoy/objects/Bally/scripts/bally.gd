extends RigidBody2D

@export var vertical_force_factor : float = 700
@export var horizontal_force_factor : float = 10
@export var radius : float = 25

@onready var audio_stream = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_stream.set_volume_db(linear_to_db(global_game.options.sound / 50))


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
	
	audio_stream.stream = preload("res://audio/boing/boing1.ogg")
	audio_stream.play()

