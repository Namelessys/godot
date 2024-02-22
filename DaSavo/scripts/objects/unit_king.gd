extends Unit

func _ready():
	ready()

func _process(delta):
	process(delta)
	if health <= 0:
		if is_enemy:
			game.win()
		else:
			game.defeat()
