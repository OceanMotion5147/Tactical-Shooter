extends Node

signal bloom_toggled(value)
signal mouse_sens_updated(value)

func toggle_fullscreen(value):
	OS.window_fullscreen = value
	

func toggle_vsycn(value):
	OS.vsync_enabled = value


func toggle_bloom(value):
	emit_signal("bloom_toggled", value)
	
	
func update_master_val(vol):
	AudioServer.set_bus_volume_db(0, vol)
	
	
func update_music_val(vol):
	AudioServer.set_bus_volume_db(1, vol)
	
	
func update_SFX_val(vol):
	AudioServer.set_bus_volume_db(2, vol)
	
	
func update_mouse_sens(value):
	emit_signal("mouse_sens_updated", value)
