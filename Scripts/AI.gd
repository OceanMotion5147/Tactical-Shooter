extends Node2D


signal state_changed(new_state)


enum State{
	PATROL,
	ENGAGE
}


onready var player_detection_zone = $PlayerDetectionZone


var current_state: int = State.PATROL setget set_state
var actor = null
var player: Player = null
var enemyweapon: Enemy_Weapon = null


func _process(delta: float) -> void:
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null and enemyweapon != null:
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				enemyweapon.shoot()
			else:
				print("In the engaged state but no weapon/player")
		_:
			print("ERROR! Found a state for enemy that should not exist")


func initialize(actor, weapon: Weapon):
	self.actor = actor
	self.weapon = enemyweapon


func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal("state_changed", current_state)


func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body
