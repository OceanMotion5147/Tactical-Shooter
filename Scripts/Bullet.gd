extends Area2D
class_name Bullet


export (int) var speed = 50


onready var kill_timer = $KillTimer
var team: int = -1


var direction = Vector2.ZERO


func _ready() -> void:
	kill_timer.start()


func _process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity
		
		
func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()




func _on_KillTimer_timeout() -> void:
	queue_free()


func _on_Bullet_body_entered(body: Node) -> void:
	if body.has_method("handle_hit"):
		if body.has_method("get_team") and body.get_team() != team:
			body.handle_hit()
		queue_free()
	if not body.name == "Player" and not body.is_in_group("ignore"):
		queue_free()
