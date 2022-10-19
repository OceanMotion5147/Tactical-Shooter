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
	
	player.connect("player_health_changed", self, "set_new_health_value")
	player.weapon.connect("weapon_ammo_changed", self, "set_current_ammo")
	#player max_ammo doesnt need to be changed as only one weapon

func set_new_health_value(new_health: int):
	health_bar.value = new_health
	

func set_current_ammo(new_ammo: int):
	current_ammo.text = str(new_ammo)
	

func set_max_ammo(new_max_ammo: int):
	max_ammo.text = str(new_max_ammo)
