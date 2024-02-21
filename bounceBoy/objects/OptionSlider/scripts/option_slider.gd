extends Node

@export var label = "OPTION"
@export var default_value : float = 0
@export var min_value : float = 0
@export var max_value : float = 9999999
@export var max_slider_value : float = 100
@export var min_slider_value : float = 0

@onready var text_label = $RichTextLabel
@onready var slider = $HSlider
@onready var text_input = $LineEdit

@onready var value = default_value

signal value_changed

var value_changed_by_text_input = false
var pre_init = true
var init = false

func set_value(new_value):
	_on_line_edit_text_changed(str(new_value))
	_on_h_slider_value_changed(new_value)

func _ready():
	init = true
	text_label.text = label
	slider.max_value = max_slider_value
	slider.min_value = min_slider_value
	slider.value = value
	text_input.text = str(value)
	init = false
	pre_init = false

func _on_h_slider_value_changed(new_value):
	if init:
		return
	if not value_changed_by_text_input:
		text_input.text = str(new_value)
		value = float(new_value)
		value_changed.emit(value)
	value_changed_by_text_input = false

func _on_line_edit_text_changed(new_text):
	if init:
		return
	value_changed_by_text_input = true
	value = float(new_text)
	if value < min_value or value > max_value:
		value = clamp(value, min_value, max_value)
		text_input.text = str(value)
	slider.value = value
	value_changed.emit(value)
