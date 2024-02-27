extends Button


func _ready():
	visible = true
	if not OS.is_debug_build():
		visible = false

func _on_button_up():
	get_tree().reload_current_scene.call_deferred()
