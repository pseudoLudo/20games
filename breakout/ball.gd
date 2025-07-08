extends CharacterBody2D

@onready var timer = $Timer
@onready var bump = $bump

var pos = global_position
var speed = Vector2(250,350)
var col
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.ZERO
	timer.start()
	pos = global_position

func _physics_process(delta):
	col = move_and_collide(velocity * delta)
	if col:
		velocity = velocity.bounce(col.get_normal())
		bump.play()


func resetBall():
	position = pos
	velocity = Vector2.ZERO
	timer.start()


func _on_timer_timeout():
	velocity = speed
