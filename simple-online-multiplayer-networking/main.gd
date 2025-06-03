extends Node


@export var player : PackedScene
@export var map : PackedScene


func _ready() -> void:
	var upnp = UPNP.new()
	upnp.discover()
	upnp.add_port_mapping(9999)
	%PublicIP.text = upnp.query_external_address()

	_on_join_button_pressed() # The clients will automatically join if a local server is created


func _on_host_button_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(9999)
	multiplayer.multiplayer_peer = peer

	multiplayer.peer_disconnected.connect(remove_player)

	%Server.show()

	load_game()


func _on_join_button_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(%To.text, 9999)
	multiplayer.multiplayer_peer = peer

	multiplayer.connected_to_server.connect(load_game)
	multiplayer.server_disconnected.connect(connection_lost)


func _on_to_text_submitted(new_text: String) -> void:
	_on_join_button_pressed() 


func load_game():
	%Menu.hide()

	if multiplayer.is_server():
		%Map.add_child(map.instantiate())

	add_player.rpc_id(1, multiplayer.get_unique_id())


func connection_lost():
	%Menu.show()

	if %Map.get_child(0):
		%Map.get_child(0).queue_free()


@rpc("any_peer")
func add_player(id):
	var player_instance = player.instantiate()
	player_instance.name = str(id)
	%Players.add_child(player_instance)


@rpc("any_peer")
func remove_player(id):
	if %Players.get_node(str(id)):
		%Players.get_node(str(id)).queue_free()
