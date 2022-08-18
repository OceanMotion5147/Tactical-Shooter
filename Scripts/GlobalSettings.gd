extends Node

signal bloom_toggled(value)

func toggle_fullscreen(value):
	OS.window_fullscreen = value
	

func toggle_vsycn(value):
	OS.vsync_enabled = value


func toggle_bloom(value):
	emit_signal("bloom_toggled", value)
