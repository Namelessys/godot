extends CharacterBody3D

const CONSTANTINOPEL = "Consinus Consarus Consus"

@export var movement_speed = 5
@export var jump_velocity = 3
@export var acceleration = 10

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_velocity
	
	var forward_direction = Input.get_axis("backward", "forward")
	var actual_acceleration = acceleration
	
	if velocity.x < 0 and forward_direction > 0 \
	or velocity.x > 0 and forward_direction < 0:
		actual_acceleration *= 2
		
	#velocity.x = move_toward(velocity.x, forward_direction * movement_speed, actual_acceleration * delta)

	var direction = transform.basis * Vector3(forward_direction, 0, 0)
	velocity = direction * movement_speed
	
	move_and_slide()
