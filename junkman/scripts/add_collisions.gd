extends Node

@export var use_convex: bool = true  # Use convex shape if true, trimesh otherwise

func add_collision(node):
	if not node.mesh:
		print("No mesh found in node: ", node.get_parent())
		return
	
	# Create a StaticBody3D to hold the collision
	var body = StaticBody3D.new()
	node.add_child(body)
	body.owner = get_tree().current_scene  # Ensure it's saved in the scene
	
	# Create a CollisionShape3D
	var collision_shape = CollisionShape3D.new()
	body.add_child(collision_shape)
	collision_shape.owner = get_tree().current_scene  # Ensure it's saved in the scene
	
	# Generate the collision shape from the mesh
	if use_convex:
		collision_shape.shape = node.mesh.create_convex_shape()
	else:
		collision_shape.shape = node.mesh.create_trimesh_shape()

func parse_node(node):
	for sub_node in node.get_children():
		if sub_node.is_class("MeshInstance3D"):
			add_collision(sub_node)
		else:
			parse_node(sub_node)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	for tile in get_children():
		parse_node(tile)
		
				
