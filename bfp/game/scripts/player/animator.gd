extends Node

var direction = 1

@onready var player = get_parent()
@onready var animation_sprite = player.find_child("AnimatedSprite2D")

func _ready():
	print(player)
	pass # Replace with function body.

func test():
	print("TT")

func play(anim):
	match (anim):
		"idle":
			animation_sprite.play("idle")
		"run":
			animation_sprite.play("run")
		"jump":
			animation_sprite.play("jump")
		"fall":
			animation_sprite.play("fall")

func change_direction(new_direction):
	direction = new_direction

func _process(delta):
	if direction < 0:
		animation_sprite.scale.x = move_toward(animation_sprite.scale.x, -1, 20 * delta)
	elif direction > 0:
		animation_sprite.scale.x = move_toward(animation_sprite.scale.x, 1, 20 * delta)
