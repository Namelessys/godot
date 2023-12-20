extends WeaponPart

@onready var output = $ConnectorOutput
#@onready var root = get_tree().root

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().get_root().editor_entered.connect(_editor_entered)
	Main.editor_exited.connect(_editor_exited)
	pass

func _init():
	init()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Main.game_state == Main.GAME_STATE.WORLD:
		look_at(get_global_mouse_position())
	
	process(delta)

func _physics_process(delta):
	physics_process(delta)

func _editor_exited():
	print("Editor exit")
	var player = Main.game_world.find_child("Player")
	var base_node = load(scene_file_path).instantiate()
	base_node.translate(player.arm_offset)
	player.add_child(base_node)
	build(base_node)
