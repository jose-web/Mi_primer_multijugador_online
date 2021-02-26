extends Node2D

const MAX_PLAYERS = 2
const PORT = 6969

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")

func _on_Multiplayer_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_server(PORT, MAX_PLAYERS)
	get_tree().set_network_peer(net)

func _on_Join_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_client("127.0.0.1", PORT)
	get_tree().set_network_peer(net)

func _player_connected(id):
	Globals.player2id = id
	var game = preload("res://Game/Game.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
