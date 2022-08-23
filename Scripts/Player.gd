extends KinematicBody2D
class_name Player

export var mouse_sensitivity = .1

export (int) var speed = 600


onready var team = $Team
onready var weapon: Weapon = $Weapon
onready var health_stat = $Health


func _ready():
	weapon.initialize(team.team)
	GlobalSettings.connect("mouse_sens_updated", self, "_on_mouse_sens_updated")


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


func get_team():
	return team.team

func handle_hit():
	if health_stat.health >0:
		health_stat.health -= 20
		print("Player Hit ", health_stat.health)
	if health_stat.health <= 0:
		print("Player has Died")


func _on_mouse_sens_updated(value):
	mouse_sensitivity = value

