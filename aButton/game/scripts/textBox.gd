extends Label

var msgs = ["!CHANGE_CHAPTER chapter_1"]
var msg
var msg_índex = 0
const CHAR_PRINT_DELAY = .03

@onready var tween = create_tween()

func _ready():
	tween.kill()
	pass

func setText(index):
	msg = msgs[index]
	#if msg.find("!") == 0:
	
	
	
	
	self.text = msg
	self.visible_ratio = 0
	tween.stop()
	tween.kill()
	tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1, len(self.text) * CHAR_PRINT_DELAY)
	tween.play()
	

func _on_button_next_msg():
	setText(msg_índex)
	if msg_índex < msgs.size() - 1:
		msg_índex += 1
