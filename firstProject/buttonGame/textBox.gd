extends Label

var msgs = [
	"Did you really just pressed that button?",
	"You are really pressing this button again?",
	"How dare you?",
	"I can't belive this is acutally happening right now.",
	"And you don't even stop pressing this button...",
	"Over...",
	"And over...",
	"And over again?",
	"Unbelievable.",
	"Do you really don't have somethign better to do with your live?",
	"Something...",
	"more productive?",
	"Something.. more educational maybe?",
	"Or just something more versatile?",
	"Anything that is not just presing this button over and over again?",
	"Followed up by waiting for it to be pressable again...",
	"No?",
	"Okay then.",
	"It's your life.",
	"So just do it.",
	"Press that button again.",
	"And again.",
	"And again.",
	"If that's what makes you happy.",
	"I won't bother anymore.",
	""
]
var msgIndex = 0
const CHAR_PRINT_DELAY = .03

@onready var tween = create_tween()

func _ready():
	tween.kill()
	pass

func setText(index):
	self.text = msgs[index]
	self.visible_ratio = 0
	tween.stop()
	tween.kill()
	tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1, len(self.text) * CHAR_PRINT_DELAY)
	tween.play()
	

func _on_button_next_msg():
	setText(msgIndex)
	if msgIndex < msgs.size() - 1:
		msgIndex += 1
