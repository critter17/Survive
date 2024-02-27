extends Node2D

const SPEED = 500
var is_paused = false

func _process(delta):
	if Input.is_action_pressed("pause"):
		is_paused = !is_paused
		
	if not %Player.is_dead and not is_paused:
		position += Vector2(-SPEED * delta, 0)
