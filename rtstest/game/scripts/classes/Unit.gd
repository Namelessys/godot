extends Node3D

class_name Unit

enum {IDLE, WALKING, WARMUP, ATTACKING, COOLDOWN, SPAWNING, DYING}
enum {GROUND, AIR}
enum {FIREND, ENEMY}

@export var radius = .5
@export var push_force = 3

@export var health: float = 1
@export var speed: float = 1
@export var range: float = 1
@export var damage: float = 1
@export var warmup: float = 1
@export var cooldown: float = 1
@export var health_bar_colors = []

@onready var max_health = health
var timer_warmup = 0
var timer_cooldown = 0
var stored_damage = 0

@export var affiliation: int = 0
var state = IDLE

var current_target: Node3D = null
var push_forces = Vector3(0, 0, 0)
var colliding_units = []

@onready var units_container = get_parent()
@onready var health_bar = find_child("HealthBar")

func get_radius():
	return radius
	


func ready():
	if health_bar_colors[affiliation - 1] != null:
		health_bar.set_progress_color(health_bar_colors[affiliation - 1])
		
	pass

func process(delta):
	if get_parent().is_paused:
		return 
	var closest_enemy = get_closes_enemy()
	
	if closest_enemy == null:
		set_state(IDLE)
	elif state == IDLE or state == WALKING:
		set_state(WALKING)
		if state == WALKING:
			current_target = closest_enemy
		if get_distance_to_unit(current_target) <= range:
			set_state(WARMUP)
	
	match state:
		IDLE:
			pass
		WALKING:
			move_to_target(delta)
		WARMUP:
			warmup_process(delta)
		ATTACKING:
			attack_process(delta)
		COOLDOWN:
			cooldown_process(delta)
		DYING:
			pass
	
	set_health(get_health() - stored_damage)
	stored_damage = 0
	if get_health() <= 0:
			set_state(DYING)
	health_bar.set_value(health / max_health)

func warmup_process(delta):
	if timer_warmup > 0:
		timer_warmup -= delta
	else:
		set_state(ATTACKING)
func attack_process(delta):
	current_target.do_damage(damage)
	set_state(COOLDOWN)
func cooldown_process(delta):
	if timer_cooldown > 0:
		timer_cooldown -= delta
	else:
		set_state(IDLE)
	
	
func move_to_target(delta):
	if current_target == null:
		return false
	
	var target_position = current_target.global_position
	var direction = target_position - global_position
	direction = direction.normalized()
	
	if target_position != position:
		look_at(target_position)
		pass
	
	push_forces += direction * speed

func calc_physics(delta):
	#var overlapping_areas = collision_area.get_overlapping_areas()
	for other in colliding_units:
		var push_direction = other.global_position - global_position
		push_direction = push_direction.normalized()
		var distance = get_distance_to_unit(other)
		if distance == -1:
			print("WARN: Units at same position: ", self, " ", other)
			self.global_position.x += radius / 10
		
		other.push_forces += (push_direction * -distance) * push_force

func get_current_target():
	return current_target
func set_current_target(new_current_target):
	current_target = new_current_target
func get_distance_to_unit(other):
	return global_position.distance_to(other.global_position) - (self.radius + other.radius)
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
func get_health():
	return health
func set_health(new_health):
	health = new_health
func get_state():
	return state
func set_state(new_state):
	match new_state:
		IDLE:
			pass
		WALKING:
			pass
		WARMUP:
			timer_warmup = warmup
		ATTACKING:
			pass
		COOLDOWN:
			timer_cooldown = cooldown
		DYING:
			pass
	state = new_state
	
func do_damage(dmg):
	stored_damage += dmg
func die():
	queue_free()
		

func test():
	return "tt"
