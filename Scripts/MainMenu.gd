extends Control

func _ready():
	$VBoxContainer/PlayButton.grab_focus()
	

func _on_PlayButton_pressed():
	get_tree().change_scene("res://SCenes/Test.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://SCenes/OptionsMenu.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
