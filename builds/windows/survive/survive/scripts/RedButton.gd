extends Area2D


func _on_body_entered(body):
	if body.name == 'Player':
		print(body.name)
		body.playEndAnimation()
		$"Button Sprite".texture = load('res://assets/red-button-pressed.png')
		
