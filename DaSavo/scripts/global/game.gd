extends Node

var world 

var menus = {
	"main": "res://scenes/menus/MainMenu.tscn"
}

func _process(delta):
	status.player.money += status.player.moeny_gain * delta

func test():
	print(find_child("PlayerSpawn", true))

func spawn_unit(UNIT, stats, spawn, is_enemy):
	var unit = UNIT.instantiate()
	if stats.money >= unit.cost:
		unit.is_enemy = is_enemy
		unit.position = world.find_child(spawn, true).global_position
		world.find_child("Units", true).add_child(unit, true)
		stats.money -= unit.cost
		return true
	else:
		unit.queue_free()
		return false
		
func spawn_player_unit(UNIT):
	return spawn_unit(UNIT, status.player, "PlayerSpawn", false)

func spawn_enemy_unit(UNIT):
	return spawn_unit(UNIT, status.enemy, "EnemySpawn", true)

func defeat():
	get_tree().change_scene_to_file(menus.main)
	
func win():
	get_tree().change_scene_to_file(menus.main)
