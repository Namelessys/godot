extends Unit

@onready var animation = $AnimationPlayer

var plays_death_animation = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ready()
	pass # Replace with function body.

func test():
	print("TTTT")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process(delta)

	match state:
		IDLE:
			animation.play("Idle")
		WALKING:
			#print("Walk")
			animation.play("Walking_A")	
		WARMUP:
			#print("Warm")
			animation.play("1H_Melee_Attack_Chop")
		ATTACKING:
			#print("A")
			pass
		COOLDOWN:
			#print("C")
			pass
		DYING:
			if !plays_death_animation:
				animation.play("Death_A")	
				plays_death_animation = true
			if !animation.is_playing():
				die()
			
func _physics_process(delta):
	physics_process(delta)
