extends KinematicBody2D
class_name Player


signal player_health_changed(new_health)
signal died 

export (int) var speed = 600


onready var team = $Team
onready var weapon: Weapon = $Weapon
onready var health_stat = $Health

func _ready():
	weapon.initialize(team.team)
	

func _physics_process(delta: float) -> void:
	var movement_direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		movement_direction.y = 1
	if Input.is_action_pressed("ui_up"):
		movement_direction.y = -1
	if Input.is_action_pressed("ui_left"):
		movement_direction.x = -1
	if Input.is_action_pressed("ui_right"):
		movement_direction.x = 1
	
	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * speed)
	
	look_at(get_global_mouse_position())


func _unhandled_input(event):
	if event.is_action_released("shoot"): 
		weapon.shoot()
	elif event.is_action_released("reload"):
		weapon.start_reload()



func reload():
	weapon.start_reload()


func get_team():
	return team.team

func handle_hit():
	if health_stat.health >0:
		health_stat.health -= 10
		emit_signal("player_health_changed", health_stat.health)
		print("Player Hit ", health_stat.health)
	if health_stat.health <= 0:
		get_tree().reload_current_scene()
		#die()
		
#func die():
	#emit_signal("died")
	#queue_free()
