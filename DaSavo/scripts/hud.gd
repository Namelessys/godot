extends Node

@onready var money_text = $MoneyDisplay/MarginContainer/MoneyText

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	money_text.text = "Money: " + str(int(player_status.money))
