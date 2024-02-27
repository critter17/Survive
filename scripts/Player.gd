extends CharacterBody2D


const H_SPEED = 30000.0
const V_SPEED = 40000.0
const JUMP_VELOCITY = -400.0
var is_dead = false
var is_at_end = false

func _process(_delta):
	if $PlayerDeadSound.playing and $PlayerDeadSound.volume_db > -50:
		$PlayerDeadSound.volume_db -= 1

func _physics_process(delta):
	if is_dead:
		return
		
	if is_at_end:
		velocity.x = 300.0;
		
	var gravity_direction = ProjectSettings.get_setting("physics/2d/default_gravity_vector");
	
	# Add the gravity.
	velocity.y = gravity_direction.y * V_SPEED * delta

	# Handle Jump.
	if Input.is_action_just_pressed("change_gravity"):
		$GravityChangeSound.play()
		velocity.y = 0
		if gravity_direction.y < 0:
			gravity_direction = Vector2.DOWN
			set_up_direction(Vector2.UP)
		elif gravity_direction.y > 0:
			gravity_direction = Vector2.UP
			set_up_direction(Vector2.DOWN)
		ProjectSettings.set_setting("physics/2d/default_gravity_vector", gravity_direction)

	move_and_slide()
	

func die():
	is_dead = true
	ProjectSettings.set_setting("physics/2d/default_gravity_vector", Vector2.DOWN)
	$"Player Sprite".hide()
	$CPUParticles2D.restart()
	$PlayerDeadSound.play()
	$"../Reset Scene".showUI()
	$"../Exit".showUI()
	
func playEndAnimation():
	is_dead = true
	$"../World/FadeToWhite".play("Camera_Shake")
