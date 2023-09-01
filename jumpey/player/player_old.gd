extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

const SPEED = 300.0
const ACCELERATION = 1000
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation.play("idle")
	pass

func _process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		var acceleration = ACCELERATION
		if direction < 0 and velocity.x > 0 \
		or direction > 0 and velocity.x < 0:
			acceleration *= 2
		velocity.x = move_toward(velocity.x, direction * SPEED, acceleration * delta)
		animation.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
	
	if velocity.x < 0:
		animation.scale.x = move_toward(animation.scale.x, -1, 20 * delta)
	elif velocity.x > 0:
		animation.scale.x = move_toward(animation.scale.x, 1, 20 * delta)
	else:
		var targetScale = clamp(1 * animation.scale.x * 100, -1, 1)
		animation.scale.x = move_toward(animation.scale.x, targetScale, 20 * delta)
	
	if velocity.x == 0:
		animation.play("idle")
	
	
	move_and_slide()
