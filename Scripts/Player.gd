extends KinematicBody2D

export (int) var speed = 300
export (float) var mouseSpeed = 1


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
