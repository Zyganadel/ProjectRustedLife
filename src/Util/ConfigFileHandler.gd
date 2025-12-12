extends Node

var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "res://src/Util/Configfiles2.cfg"

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		config.set_value("Audio", "MainMusic", 0.5)
		config.set_value("Video", "FullScreen", false)
		
		config.save(SETTINGS_FILE_PATH)
		
	else:
		config.load(SETTINGS_FILE_PATH)
	

func _save_video_setting(key: String, value):
	config.set_value("Video", key, value)
	config.save(SETTINGS_FILE_PATH)
	
func load_video_settings():
	var video_settings = {}
	for key in config.get_section_keys("Video"):
		video_settings[key] = config.get_value("Video", key)
	return video_settings
	

func save_audio_setting(key:String, value):
	config.set_value("Audio", key, value)
	config.save(SETTINGS_FILE_PATH)
	
func load_audio_settings():
	var audio_settings = {}
	for key in config.get_section_keys("Audio"):
		audio_settings[key] = config.get_value("Audio", key)
	return audio_settings
