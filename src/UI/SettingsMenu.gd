extends Control

@onready var volume_control: HSlider = $Control/Panel/VolumeControl
@onready var check_button: CheckButton = $Control/Panel/CheckButton


func _ready() -> void:
	var video_settings = ConfigFileHandler.load_video_settings()
	check_button.button_pressed = video_settings.FullScreen
	
	var audio_settings = ConfigFileHandler.load_audio_settings()
	volume_control.value = min(audio_settings.MainMusic, 1.0) * 100
	


func Onbuttonbutton_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing/MainMenu.tscn")


func Onvolume_controldrag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_setting("MainMusic", volume_control.value / 100)


func Oncheck_buttontoggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	ConfigFileHandler._save_video_setting("FullScreen", false)
