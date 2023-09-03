extends Node2D

class_name WeaponPart

var b_dragging = false
var v2_org_position
#var a_connector_inputs
var b_even_frame = false

signal s_drag_part
signal s_drop_part

@onready var o_own_dragging_area = $DraggingArea
@onready var a_own_connectors = find_children("Connector*", "", true)

func is_in_valid_position():
	if o_own_dragging_area.has_overlapping_areas():
		for _overlapping_area in o_own_dragging_area.get_overlapping_areas():
			if _overlapping_area.get_name() == "DraggingArea":
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
	set_position(get_global_mouse_position()) # gets overwritten if connectors are found
	
	#print(get_global_position())
	
	if b_even_frame:
		# not working in current godot version
		for _own_connector in a_own_connectors:
			var _connector = _own_connector.get_overlapping_connector()
			if _connector:
				#position = _connector.get_parent().position + _connector.position + _own_connector.position
				print("T")
				position = Vector2(1, 1)
				return
	
		

func _init():
	s_drag_part.connect(drag_part)
	s_drop_part.connect(drop_part)
	pass
	#parent_node = object_node
	
func process(_delta):
	#a_connector_inputs = find_children("ConnectorInput*", "", true)
	#a_connector_outputs = find_children("WeaponConnectorOutput*", "", true)
	
	b_even_frame = !b_even_frame
	
	if b_dragging:
		process_dragging()
		
	
	pass
