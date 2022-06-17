extends KinematicBody2D


onready var health_stat = $Health
onready var ai = $AI
onready var weapon = $EnemyWeapon


func _ready() -> void:
	ai.initialize(self, weapon)


func handle_hit():
	if health_stat.health >0:
		health_stat.health -= 20
		print("Enemy Hit ", health_stat.health)
	if health_stat.health <= 0:
		print("Enemy has Died")
		queue_free()
