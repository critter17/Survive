extends Button

func _ready():
	visible = false


func _on_button_up():
	get_tree().change_scene_to_file("res://scenes/title.tscn")


func showUI():
	visible = true
