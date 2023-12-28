extends Node

@onready var head = $Head
@onready var body = $Body
@onready var leg1 = $Body/Leg1
@onready var lower_leg1 = $Body/Leg1/LowerLeg1
@onready var leg2 = $Body/Leg2
@onready var lower_leg2 = $Body/Leg2/LowerLeg2
@onready var ray_cast = $Body/RayCast2D

@onready var pos_y = body.position.y
@onready var pos_x = body.position.x

var is_walking = true

# Called when the node enters the scene tree for the first time.
func _ready():
	head.lock_rotation = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if ray_cast.is_colliding():
		is_walking = false
	else:
		is_walking = true
	
	if is_walking:
		
		pos_x = pos_x + 1
		leg1.apply_torque(90000)
		lower_leg1.apply_torque(90000)
		leg2.apply_torque(90000)
		lower_leg2.apply_torque(90000)
		
	body.position = Vector2(pos_x, pos_y)
