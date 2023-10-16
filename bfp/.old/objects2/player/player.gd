extends RigidBody2D

@onready var animation = $AnimatedSprite2D

const SPEED = 400.0
const ACCELERATION = 2000
const JUMP_FORCE = -400.0
const BREAK_FOCE_VELOCITY_THRESHOLD = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func is_on_floor():
	return true

func _ready():
	animation.play("idle")
	pass
	
func _integrate_forces(state):
	print(state)

func _physics_process(delta):
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
			
		animation.play("run")
		if direction < 0:
			animation.scale.x = move_toward(animation.scale.x, -1, 20 * delta)
		elif direction > 0:
			animation.scale.x = move_toward(animation.scale.x, 1, 20 * delta)
	else:
		var moveDirection = clamp(1 * velocity.x * 100, -1, 1)
		var targetScale = clamp(1 * animation.scale.x * 100, -1, 1)
		
		if abs(velocity.x) > BREAK_FOCE_VELOCITY_THRESHOLD:
			apply_central_force(Vector2(-moveDirection * ACCELERATION, 0))
		
		animation.scale.x = move_toward(animation.scale.x, targetScale, 20 * delta)
	
	if not is_on_floor():
		if velocity.y < 0:
			animation.play("jump")
		elif velocity.y > 0:
			animation.play("fall")
	elif velocity.x == 0:
		animation.play("idle")
		
	
	
	#move_and_slide()
