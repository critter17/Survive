extends Area2D




func _on_body_entered(body):
	if body.name == 'Player':
		$"../..".is_paused = true
		body.is_at_end = true
