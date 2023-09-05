extends Node2D

class_name WeaponConnector

@onready var b_is_input_connector = (true if get_name().find("ConnectorInput") == 0 else false)
@onready var o_own_connection_area = $ConnectionArea

var o_current_overlapping_connector # gets updated when get_overlapping_connector is called

var d_areas = {}
var o_area
var b_draw_clear_needed = true

func get_overlapping_connector():
	if o_own_connection_area.has_overlapping_areas():
		for _overlapping_area in o_own_connection_area.get_overlapping_areas():
			if _overlapping_area.get_name().find("ConnectionArea") == 0 and \
				get_parent() != _overlapping_area.get_parent() \
			:
				o_current_overlapping_connector = _overlapping_area.get_parent()
				return o_current_overlapping_connector
	o_current_overlapping_connector = null

func get_connection_state():
	get_overlapping_connector()
	if not o_current_overlapping_connector:
		return WeaponEditor.CONNECTOR_NOT_CONNECTED
	elif o_current_overlapping_connector and o_current_overlapping_connector.b_is_input_connector != b_is_input_connector:
		return WeaponEditor.CONNECTOR_CONNECTED
	else:
		return WeaponEditor.CONNECTOR_INVALID_CONNECTION
	
func is_valid():
	pass

func _init():
	pass
	
func ready():
	pass
	
func process(_delta):
	if WeaponEditor.b_dragging_part:
		b_draw_clear_needed = true
		queue_redraw()
	elif b_draw_clear_needed:
		b_draw_clear_needed = false
		queue_redraw()
	pass
	
func draw():
	if WeaponEditor.b_dragging_part:
		match get_connection_state():
			WeaponEditor.CONNECTOR_NOT_CONNECTED:
				if b_is_input_connector:
					draw_circle(Vector2(0, 0), 1, Color(.1, .2, .6))
				else:
					draw_circle(Vector2(0, 0), 1, Color(.3, .4, .8))
			WeaponEditor.CONNECTOR_CONNECTED:
				draw_circle(Vector2(0, 0), 1, Color(.2, .8, .3))
			WeaponEditor.CONNECTOR_INVALID_CONNECTION:
				draw_circle(Vector2(0, 0), 1, Color(.8, .3, .2))
		
