extends Node2D

func shrink():
	var currentScale = scale
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(currentScale.x, currentScale.y - 0.25), 1)
	tween.connect("finished", _on_tween_finished)

func _on_tween_finished():
	%obstacles.is_paused = false


func _on_fade_to_white_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://scenes/title.tscn")
