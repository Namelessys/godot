extends Area2D

var speed : Vector2

func start(pos, new_speed : Vector2 = speed):
	position = pos
	speed = new_speed
	print(new_speed.y)
	
	
func _process(delta):
	position.x += speed.x * delta
	position.y += speed.y * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		area.explode()
		queue_free()
