extends Control


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
	
func Onstartgame_buttonbutton_down() -> void:
	get_tree().change_scene_to_file("uid://ii6l6x1ifhuy")
	
	

func Onsettings_buttonbutton_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing/SettingsMenu.tscn")
	
	

func Onexit_buttonbutton_down() -> void:
	get_tree().quit()
	
