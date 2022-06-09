extends KinematicBody2D
class_name Player


signal player_fired_bullet(bullet, position, direction)

 
export (int) var speed = 600


onready var weapon = $Weapon
onready var health_stat = $Health


func _ready() -> void:
	weapon.connect("weapon_fired", self, "shoot")
	
	
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


func shoot(bullet_instance ,location: Vector2, direction: Vector2):
	emit_signal("player_fired_bullet", bullet_instance, location, direction)


func handle_hit():
	health_stat.health -= 20
	print("Player Hit!!", health_stat.health)
