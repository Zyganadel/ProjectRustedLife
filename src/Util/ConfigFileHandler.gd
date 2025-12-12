extends Node

var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "res://src/Util/Configfiles2.cfg"

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		config.set_value("Audio", "MainMusic", 1)
		config.set_value("Video", "FullScreen", false)
		
		config.save(SETTINGS_FILE_PATH)
		
		
