extends WeaponPart

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().get_root().editor_entered.connect(_editor_entered)
	Main.editor_exited.connect(_editor_exited)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process(delta)

func _physics_process(delta):
	physics_process(delta)

func _editor_exited():
	print("Editor exit")
