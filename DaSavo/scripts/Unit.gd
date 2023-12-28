extends Node
class_name Unit

@export var is_enemy = false
@export var walk_speed = 1
@export var max_health : float = 100
@export var health : float = 100
@export var damage : float = 1

#qonready
var enemy_detectors = []

var is_walking = true
var is_attacking = true

func get_health():
	return health

func get_max_health():
	return max_health

func set_collision_layers(name_to_change, class_to_change):
	for child in find_children(name_to_change, class_to_change, true):
		if child.has_method("get_collision_layer") and child.get_collision_layer() == 256:
			if not is_enemy:
				child.set_collision_layer(512)
			else:
				child.set_collision_layer(1024)
		if child.has_method("get_collision_mask") and child.get_collision_mask() == 256:
			if not is_enemy:
				child.set_collision_mask(1024)
			else:
				child.set_collision_mask(512)

func ready():
	set_collision_layers("", "RigidBody2D")
	set_collision_layers("", "StaticBody2D")
	set_collision_layers("*_EnemyDetector", "")
	
	if not is_enemy:
		for child in find_children("Left_*"):
			child.queue_free()
	else:
		for child in find_children("Right_*"):
			child.queue_free()
		walk_speed = -walk_speed
	
	enemy_detectors = find_children("*EnemyDetector*", "", true)
		

func process(_delta):
	pass

func physics_process(_delta):
	for enemy_detector in enemy_detectors:
		if enemy_detector != null:
			#print(enemy_detector)
			#print(enemy_detector, ", " , enemy_detector.is_colliding(), ", ", enemy_detector.get_collision_mask())
			if enemy_detector.is_colliding():
				is_walking = false
				is_attacking = true
			else:
				is_walking = true
				is_attacking = false

func hit(damage):
	#print(health, " ", damage)
	health -= damage

func die():
	self.queue_free()
