extends Popup

#Video Settings
onready var display_options = $SettingTabs/Video/MarginContainer/VideoSettings/DisplayOptions
onready var vsync_btn = $SettingTabs/Video/MarginContainer/VideoSettings/VsyncBtn
onready var display_fps_btn = $SettingTabs/Video/MarginContainer/VideoSettings/DisplayFpsBtn
onready var max_fps_val = $SettingTabs/Video/MarginContainer/VideoSettings/MaxFpsOption/MaxFpsVal
onready var max_fps_slider = $SettingTabs/Video/MarginContainer/VideoSettings/MaxFpsOption/MaxFpsSlider
onready var bloom_btn = $SettingTabs/Video/MarginContainer/VideoSettings/BloomBtn
onready var brightness_slider = $SettingTabs/Video/MarginContainer/VideoSettings/BrightnessSlider

#Audio Settings
onready var master_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider
onready var music_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider
onready var sfx_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider

#Gameplay Settings
onready var mouse_sens_amount = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSensAmount
onready var mouse_slider = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSlider

func _ready():
	
	display_options.select(1 if Save.game_data.fullscreen_on else 0)
	GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen_on)
	vsync_btn.pressed = Save.game_data.vsync_on
	display_fps_btn.pressed = Save.game_data.display_fps
	max_fps_slider.value = Save.game_data.max_fps
	bloom_btn.pressed = Save.game_data.bloom_on
	brightness_slider.value = Save.game_data.brightness

	master_slider.value = Save.game_data.master_vol

	mouse_slider.value = Save.game_data.mouse_sens
	
	


func _on_DisplayOptions_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)
	
	
func _on_VsyncBtn_toggled(button_pressed):
	GlobalSettings.toggle_vsync(button_pressed)


func _on_BloomBtn_toggled(button_pressed):
	GlobalSettings.toggle_bloom(button_pressed)


func _on_MasterSlider_value_changed(value):
	GlobalSettings.update_master_vol(value)


func _on_MouseSlider_value_changed(value):
	GlobalSettings.update_mouse_sens(value)
	mouse_sens_amount.text = str(value)


func _on_MusicSlider_value_changed(value):
	GlobalSettings.update_music_vol(value)
