extends KinematicBody2D

export (PackedScene) var Bullet
export (int) var speed = 300
export (float) var mouseSpeed = 1

onready var end_of_gun= $EndOfGun

var velocity = Vector2()

func get_input():
	look_at(get_global_mouse_position()* mouseSpeed)
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed,0).rotated(rotation)
		$AnimatedSprite.play("WalkWithGun")
	elif Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed,0).rotated(rotation)
		$AnimatedSprite.play("WalkWithGun")
	elif Input.is_action_pressed("ui_left"):
		velocity = Vector2(0,-speed).rotated(rotation)
		$AnimatedSprite.play("WalkWithGun")
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2(0,speed).rotated(rotation)
		$AnimatedSprite.play("WalkWithGun")
	else:
		$AnimatedSprite.play("Idle")
		
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event):
	if event.is_action_released("shoot"):
		shoot()

func shoot():
	var bullet_instance = Bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_positon = end_of_gun.global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = bullet_instance.global_positon.direction_to(target).normalized()
