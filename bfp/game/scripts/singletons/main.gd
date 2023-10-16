extends Node

signal world_entered
signal world_exited
signal editor_entered
signal editor_exited

enum GAME_STATE {WORLD, EDITOR}

static var game_state = GAME_STATE.WORLD

func change_game_state(state):
	game_state = state
