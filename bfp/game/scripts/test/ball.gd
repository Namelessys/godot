extends Node2D

var speed = 100

@onready var animator = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_speed(new_speed):
	speed = new_speed

func _physics_process(delta):
	position.y += speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("debug_jump"):
		set_speed(100)
		position.y -= 50
	
func _on_area_2d_body_entered(_body):
	animator.play("Bounce")
