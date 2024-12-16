extends Node3D

@onready var camera = $Camera3D
@onready var root = get_parent()

@export var unit = "res://game/tscns/units/Dummy.tscn"
@export var unit_container: Node

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		root.spawn_unit(0, unit, get_mouse_position_in_3d_space())
		

func get_mouse_position_in_3d_space():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_lenght = 1000
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_lenght
	var space = camera.get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	ray_query.collision_mask = Global.GROUND_LAYER
	var raycast_result = space.intersect_ray(ray_query)
	if raycast_result:
		return raycast_result.position
	
		
	
