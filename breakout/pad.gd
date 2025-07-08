extends CharacterBody2D

var direction 
var speed = 700
var pos = global_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pos = global_position
	


func _physics_process(delta):
	direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_pressed("right"):
		direction.x = 1
	velocity = direction * speed * delta
	move_and_collide(velocity)
	
func padReset():
	position = pos
