extends Node2D

class_name WeaponPart

var b_dragging = false
var v2_org_position
var o_overlapping_connector
#var a_connector_inputs

@onready var o_own_dragging_area = $DraggingArea
@onready var a_own_connectors = find_children("Connector*", "", true)

func is_in_valid_position():
	if o_own_dragging_area.has_overlapping_areas():
		for _overlapping_area in o_own_dragging_area.get_overlapping_areas():
			if _overlapping_area.get_name() == "DraggingArea":
				#return false
				pass
	for _own_connector in a_own_connectors:
		if _own_connector.get_connection_state() == WeaponEditor.CONNECTOR_INVALID_CONNECTION:
			return false
		
	return true

func drag_part():
	b_dragging = true
	v2_org_position = position
	
func drop_part():
	b_dragging = false
	if !is_in_valid_position():
		position = v2_org_position
		return false
	return true
	
func process_dragging():
	for _own_connector in a_own_connectors:
		o_overlapping_connector = _own_connector.get_overlapping_connector()
		if o_overlapping_connector:
			global_translate(o_overlapping_connector.get_global_position() - _own_connector.get_global_position())
			o_overlapping_connector = null
			return
		o_overlapping_connector = null

func get_connected_parts():
	var connected_parts = []
	
	for connector_output in find_children("ConnectorOutput*"):
		for area in connector_output.find_child("ConnectionArea").get_overlapping_areas():
			connected_parts.append(area.get_parent().get_parent())
	return connected_parts
	
func build(base):
	for part in get_connected_parts():
		var new_part = load(part.scene_file_path).instantiate()
		new_part.transform = part.transform
		base.add_child(new_part)
		part.build(base)

func init():
	if Main.game_state == Main.GAME_STATE.EDITOR:
		Main.world_exited.connect(_world_exited)
		print("INIT")
	
func _world_exited():
	print("WORLD EXIT")
	queue_free()

func process(_delta):
	if b_dragging:
		process_dragging()
	

func physics_process(_delta):
	if b_dragging:
		set_position(get_global_mouse_position()) # gets overwritten if connectors are found
	pass
