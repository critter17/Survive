extends Area2D



func _on_body_entered(body):
	if body.name == 'Player':
		$"../..".is_paused = true
		print('obstacles position: ', $"../..".position)
		var world = get_node('/root/Game/World')
		world.shrink()
