extends Button


func _ready():
	visible = true
	if not OS.is_debug_build():
		visible = false
		

func _on_button_up():
	%obstacles.position = Vector2(-5000, 536)
	%World.scale = Vector2(2.0, 1.75)
	%Player.position = Vector2(%Player.position.x, 544.0)
