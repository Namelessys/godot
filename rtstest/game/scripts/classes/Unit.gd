extends Node3D

class_name Unit

enum {WALKING, ATTACKING, SPAWNING, DYING}
enum {GROUND, AIR}
enum {FIREND, ENEMY}

@export var health = 1
@export var speed = 1
@export var range = 1
@export var damage = 1

@export var affiliation: int = 0
var current_target: Node3D = null
var push_forces = Vector3(0, 0, 0)

@onready var collision_area = find_child("CollisionArea")
@onready var radius = collision_area.find_child("Shape").shape.radius
@onready var units_container = get_parent()


func get_radius():
	return radius

func get_current_target():
	return current_target
func set_current_target(new_current_target):
	current_target = new_current_target

func get_distance_to_unit(other):
	return global_position.distance_to(other.global_position) - (self.radius + other.radius)
	

func ready():
	pass

func process(delta):
	if get_parent().is_paused:
		return 
		
	var closest_enemy = get_closes_enemy()
	if closest_enemy != null:
		current_target = closest_enemy
	move_to_target(delta)
	
func physics_process(delta):
	if get_parent().is_paused:
		return 
		
	calc_physics()
	
func get_closes_enemy():
	var closest_enemy = null
	var closest_distance = Global.INT_MAX
	for unit in units_container.get_children():
		if unit != self && unit.affiliation != self.affiliation:
			var distance = get_distance_to_unit(unit)
			if distance < closest_distance:
				closest_distance = distance
				closest_enemy = unit
	return closest_enemy
	
func move_to_target(delta):
	if current_target == null:
		return false
	
	var target_position = current_target.global_position
	var direction = target_position - global_position
	direction = direction.normalized()
	
	if target_position != position:
		look_at(target_position)
	
	global_position += direction * speed * delta 

func calc_physics():
	var overlapping_areas = collision_area.get_overlapping_areas()
	
	for area in overlapping_areas:
		var other = area.get_parent()
		var push_direction = other.global_position - global_position
		push_direction = push_direction.normalized()
		var distance = get_distance_to_unit(other)
		
		other.push_forces += push_direction * -distance
		#other.global_transform.origin = other.global_transform.origin + push_direction * -distance
		

func test():
	return "tt"
