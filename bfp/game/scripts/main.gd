extends Main

@onready var editor
@onready var world

var first_frame = true

# Called when the node enters the scene tree for the first time.
func _ready():
	editor = load("res://game/scenes/weapon_editor.tscn").instantiate()
	world = load("res://game/scenes/test_world_1.tscn").instantiate()
	
	Main.game_world = world
	
	#add_child(editor)
	add_child(world)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Engine.max_fps = 10
	
	if Input.is_action_just_pressed("open_weapon_editor") and Main.game_state == GAME_STATE.WORLD:
		print("[Main]: Open editor")
		Main.editor_entered.emit()
		Main.world_exited.emit()
		remove_child(world)
		add_child(editor)
		Main.change_game_state(GAME_STATE.EDITOR)
	elif Input.is_action_just_pressed("close_weapon_editor") and Main.game_state == GAME_STATE.EDITOR:
		print("[Main]: Close editor")
		Main.editor_exited.emit()
		Main.world_entered.emit()
		remove_child(editor)
		add_child(world)
		Main.change_game_state(GAME_STATE.WORLD)
