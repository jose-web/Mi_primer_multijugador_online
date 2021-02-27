extends Spatial

onready var Player1Pos = $Player1Pos
onready var Player2Pos = $Player2Pos

func _ready():
	var player1 = preload("res://Player/Player.tscn").instance()
	player1.set_name(str(get_tree().get_network_unique_id()))
	player1.set_network_master(get_tree().get_network_unique_id())
	player1.global_transform = Player1Pos.global_transform
	add_child(player1)
	
	var player2 = preload("res://Player/Player.tscn").instance()
	player2.set_name(str(Globals.player2id))
	player2.set_network_master(Globals.player2id)
	player2.global_transform = Player2Pos.global_transform
	add_child(player2)
