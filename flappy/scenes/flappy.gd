extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	Manager.pipecollision.connect(pipecollide)
	set_physics_process(true)
	animated_sprite_2d.play("default")
	
	
func _physics_process(delta: float) -> void:
	flap(delta)

func flap(delta):
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("action"):
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()
	
	
func pipecollide():
	set_physics_process(false)
	animated_sprite_2d.stop()


func _on_floors_body_entered(body: Node2D) -> void:
	pipecollide()
