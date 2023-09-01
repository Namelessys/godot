extends RigidBody2D

@onready var animation = $AnimatedSprite2D

const SPEED = 400.0
const ACCELERATION = 2000
const JUMP_FORCE = -400.0
const BREAK_FOCE_VELOCITY_THRESHOLD = 30

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func is_on_floor(): #ToDo: 
	return true

func _ready():
	animation.play("idle")
	pass
	
func  _integrate_forces(state):
	var velocity = linear_velocity

	if Input.is_action_just_pressed("ui_up"):
		apply_central_impulse(Vector2(0, JUMP_FORCE))
		pass

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		var acceleration = ACCELERATION
		if direction < 0 and velocity.x > 0 \
		or direction > 0 and velocity.x < 0:
			acceleration *= 2
		
		if abs(velocity.x) < SPEED:
			apply_central_force(Vector2(direction * acceleration, 0))
	else:
		var moveDirection = clamp(1 * velocity.x * 100, -1, 1)
		
		print(velocity.x)
		print(state.linear_velocity.x)
		
		if abs(velocity.x) > BREAK_FOCE_VELOCITY_THRESHOLD:
			apply_central_force(Vector2(-moveDirection * ACCELERATION, 0))
		else:
			state.linear_velocity = Vector2(0, state.linear_velocity.y)
	
		
func _process(delta):
	var velocity = linear_velocity
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		animation.play("run")
		if direction < 0:
			animation.scale.x = move_toward(animation.scale.x, -1, 20 * delta)
		elif direction > 0:
			animation.scale.x = move_toward(animation.scale.x, 1, 20 * delta)
	else:
		var targetScale = clamp(1 * animation.scale.x * 100, -1, 1)
		animation.scale.x = move_toward(animation.scale.x, targetScale, 20 * delta)
	
	if not is_on_floor():
		if velocity.y < 0:
			animation.play("jump")
		elif velocity.y > 0:
			animation.play("fall")
	elif velocity.x == 0:
		animation.play("idle")
	
	
	#move_and_slide()
