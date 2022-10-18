extends CanvasLayer


onready var health_bar = $MarginContainer/Rows/MiddleRow/HealthBar
onready var current_ammo = $MarginContainer/Rows/BottomRow/CurrentAmmo
onready var max_ammo = $MarginContainer/Rows/BottomRow/MaxAmmo


var player: Player


func set_player(player: Player):
	self.player = player
	
	set_new_health_value(player.health_stat.health)
	set_current_ammo(player.weapon.current_ammo)
	set_max_ammo(player.weapon.max_ammo)


func set_new_health_value(new_health: int):
	pass
	

func set_current_ammo(new_ammo: int):
	pass
	

func set_max_ammo(new_max_ammo: int):
	pass
