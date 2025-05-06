extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	flap(delta)

func flap(delta):
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("action"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
