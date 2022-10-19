extends Node2D


onready var bullet_manager = $BulletManager
onready var player: Player = $Player
onready var gui = $GUI
onready var camera = $Player/Camera2D



func _ready() -> void:
	randomize()
	GlobalSignals.connect("bullet_fired", bullet_manager, "handle_bullet_spawned")
	
	spawn_player()

func spawn_player():
	gui.set_player(player)
	
	
