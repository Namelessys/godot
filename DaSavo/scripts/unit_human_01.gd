extends Unit

@onready var head = $Head
@onready var body = $Body
@onready var leg1 = $Body/Leg1
@onready var lower_leg1 = $Body/Leg1/LowerLeg1
@onready var leg2 = $Body/Leg2
@onready var lower_leg2 = $Body/Leg2/LowerLeg2
@onready var arm1 = $Body/Arm1
@onready var lower_arm1 = $Body/Arm1/LowerArm1
@onready var arm2 = $Body/Arm2
@onready var lower_arm2 = $Body/Arm2/LowerArm2

@onready var pos_y = body.position.y
@onready var pos_x = body.position.x

@export var leg_torque = 90000
@export var lower_leg_torque = 100000
@export var arm_torque = 90000
@export var lower_arm_torque = 90000

func _ready():
	ready()
	head.lock_rotation = true
	lower_arm1.body_entered.connect(_hit)
	lower_arm2.body_entered.connect(_hit)
	
	if is_enemy:
		leg_torque = -leg_torque
		lower_leg_torque = -lower_leg_torque
		arm_torque = -arm_torque
		lower_arm_torque = -lower_arm_torque

func _process(delta):
	process(delta)
	
func _physics_process(delta):
	physics_process(delta)
	
	if is_walking:
		pos_x += walk_speed
		leg1.apply_torque(leg_torque)
		lower_leg1.apply_torque(lower_leg_torque)
		leg2.apply_torque(leg_torque)
		lower_leg2.apply_torque(lower_leg_torque)
	
	if is_attacking:
		arm1.apply_torque(arm_torque)
		lower_arm1.apply_torque(lower_arm_torque)
		arm2.apply_torque(arm_torque)
		lower_arm2.apply_torque(lower_arm_torque)
		
	body.position = Vector2(pos_x, pos_y)
	
	if health <= 0:
		die()

func _hit(other_body):
	var new_other_body = other_body.find_parent("Unit_*")
	if new_other_body != null:
		other_body = new_other_body
	if other_body.has_method("hit"):
		other_body.hit(damage)
