extends Control

onready var options_menu = $OptionsMenu
onready var play_btn = $VBoxContainer/PlayButton

func _ready():
	play_btn.grab_focus()


func _on_PlayButton_pressed():
	get_tree().change_scene("res://SCenes/Test.tscn")


func _on_OptionsButton_pressed():
	options_menu.popup_centered()


func _on_QuitButton_pressed():
	get_tree().quit()
