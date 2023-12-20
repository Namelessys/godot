extends CharacterBody2D

@export var arm_offset : Vector2 = Vector2(0, 0)

#@onready var animation = $AnimatedSprite2D
@onready var animator = $Animator

const SPEED = 400.0
const ACCELERATION = 1000
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#animation.play("idle")
	animator.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("game_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("game_left", "game_right")
	if direction:
		var acceleration = ACCELERATION
		if direction < 0 and velocity.x > 0 \
		or direction > 0 and velocity.x < 0:
			acceleration *= 2
		velocity.x = move_toward(velocity.x, direction * SPEED, acceleration * delta)
		animator.play("run")
		if direction < 0:
			animator.change_direction(-1)
		elif direction > 0:
			animator.change_direction(1)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
	
	if not is_on_floor():
		if velocity.y < 0:
			animator.play("jump")
		elif velocity.y > 0:
			animator.play("fall")
	elif velocity.x == 0:
		animator.play("idle")
		
	move_and_slide()
