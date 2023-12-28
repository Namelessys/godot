extends Unit

func _ready():
	ready()

func _process(delta):
	process(delta)
	
func _physics_process(delta):
	physics_process(delta)
	
	if health <= 0:
		die()
