extends Node2D

class_name WeaponConnector

var o_own_connection_area

var d_areas = {}
var o_area

func add_area(area):
	print(area)
	if area.get_name().find("ConnectionArea") == 0:
		print("Enter: ", area)
		d_areas[area] = true
		
		o_area = area
	
	o_area = area

func remove_area(area):
	print("Exit: ", area)
	d_areas.erase(area)
	o_area = null

func get_overlapping_connector():
	if o_area:
		return o_area.get_parent()
	#for _area in d_areas:
		#return _area.get_parent()
		
	
	if o_own_connection_area.has_overlapping_areas() and false:
		for _overlapping_area in o_own_connection_area.get_overlapping_areas():
			if _overlapping_area.get_name().find("ConnectionArea") == 0 and \
				get_parent() != _overlapping_area.get_parent() \
			:
				return _overlapping_area.get_parent()

func is_valid():
	pass

func _init():
	pass
	
func ready():
	o_own_connection_area = $ConnectionArea
	o_own_connection_area.area_entered.connect(add_area)
	o_own_connection_area.area_exited.connect(remove_area)
	

func process(_delta):
	#print($ConnectionArea)
	#print(get_global_position())
	pass
