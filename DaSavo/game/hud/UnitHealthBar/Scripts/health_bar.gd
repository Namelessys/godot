extends Node

@export var player_color = "2f7644"
@export var enemy_color = "9f002e"

@onready var health_bar = $Health
@onready var health_bar_size = health_bar.get_size()
@onready var parent = find_parent("Unit_*")

var health = 1

func _ready():
	if not parent.is_enemy:
		health_bar.find_child("ColorRect").color = Color(player_color)
	else:
		health_bar.find_child("ColorRect").color = Color(enemy_color)

func _process(_delta):
	if parent.has_method("get_health"):
		health = parent.get_health() / parent.get_max_health()
		health_bar.set_size(Vector2(health_bar_size[0] * health, health_bar_size[1]))

func get_health():
	return health

func set_health(new_health):
	health = new_health
