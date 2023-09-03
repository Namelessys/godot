extends Node2D

@onready var a_weapon_parts = self.find_children("WP_*", "", true)

var o_dragging_part
var o_marked_part

var callable_mark_part = Callable(mark_part)
var callable_unmark_part = Callable(unmark_part)

func mark_part(part):
	o_marked_part = part
	pass

func unmark_part(_part):
	o_marked_part = null
	
func drag_part(_part):
	o_dragging_part = o_marked_part
	o_dragging_part.s_drag_part.emit()

func drop_part(_part):
	o_dragging_part.s_drop_part.emit()
	o_dragging_part = null

func _ready():
	for _weapon_part in a_weapon_parts:
		_weapon_part.find_child("DraggingArea", true).mouse_entered.connect(callable_mark_part.bind(_weapon_part))
		_weapon_part.find_child("DraggingArea", true).mouse_exited.connect(callable_unmark_part.bind(_weapon_part))
	

func _process(_delta):
	#print("New frame")
	
	if Input.is_action_just_pressed("game_drag_weapon_part") and o_marked_part and !o_dragging_part:
		drag_part(o_marked_part)
	
	if Input.is_action_just_released("game_drag_weapon_part") and o_dragging_part:
		drop_part(o_dragging_part)
	
	pass
