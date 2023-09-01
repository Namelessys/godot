extends Button

@onready var overlay = $Overlay
const timeoutTime = 3
var timeout: float = 0

signal next_msg

func _process(delta):
	timeout = max(0, timeout - delta / timeoutTime)
	overlay.set_size(Vector2(size[0] * timeout, size[1]))
	if timeout <= 0:
		self.disabled = false
	

func _on_pressed():
	if timeout <= 0:
		timeout = 1
		next_msg.emit()
		self.disabled = true
	
	
