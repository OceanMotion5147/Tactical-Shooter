extends Control

func _ready():
	$MainMenu/CenterContainer/HBoxContainer/CenterContainer/VBoxContainer/START.grab_focus()

func _on_START_pressed():
	get_tree().change_scene("res://SCenes/Test.tscn")


func _on_OPTIONS_pressed():
	$AnimationPlayer.play("Options")


func _on_QUIT_pressed():
	get_tree().quit()


func _on_BACK_pressed():
	$AnimationPlayer.play("MoveToMain")


func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false

#TESTING IF THIS WILL WANT TO WORK AND GITHUB
