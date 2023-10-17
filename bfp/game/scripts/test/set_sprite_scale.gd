extends Sprite2D

@export var scale_y: float

@onready var org_scale_y = scale.y

func _ready():
	pass # Replace with function body.

func _process(_delta):
	scale.y = org_scale_y * scale_y
