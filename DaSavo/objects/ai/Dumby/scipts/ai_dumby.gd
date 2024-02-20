extends Node

@export var money : float = 0
@export var money_gain : float = 1
@export var health : float = 100
@export var health_gain : float = 9
@export var min_attack_cooldown : float = 1
@export var max_attack_cooldown : float = 5
@export var min_spawn_delay : float = .1
@export var max_spawn_delay : float = 1
@export var unit : PackedScene

@onready var stats = status.enemy

var rng = RandomNumberGenerator.new()
var attack_cooldown = 0
var spawn_cooldown = 0
var is_attacking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	stats.money = money
	stats.money_gain = money_gain
	stats.health = health
	stats.health_gain = health_gain


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stats.money += stats.money_gain * delta
	
	if attack_cooldown <= 0:
		if spawn_cooldown <= 0:
			if game.spawn_enemy_unit(unit):
			#if true:
				spawn_cooldown = rng.randf_range(min_spawn_delay, max_spawn_delay)
			else:
				attack_cooldown = rng.randf_range(min_attack_cooldown, max_attack_cooldown)
				
	
	attack_cooldown -= delta
	spawn_cooldown -= delta
