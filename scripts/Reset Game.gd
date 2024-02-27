extends Button


func _ready():
	visible = false

func _on_button_up():
	get_tree().reload_current_scene.call_deferred()
	
func showUI():
	visible = true
