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
onready var fov_amount = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/FovOption/FovAmount
onready var fov_slider = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/FovOption/FovSlider
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

	fov_slider.value = Save.game_data.fov
	mouse_slider.value = Save.game_data.mouse_sens
	
	

