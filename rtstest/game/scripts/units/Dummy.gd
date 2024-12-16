extends Unit

func _ready():
	ready()

func _process(delta):
	if is_instance_valid(health_bar):
		print(health_bar.value)
	process(delta)
