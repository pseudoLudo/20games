extends CharacterBody2D

@onready var timer = $Timer
@onready var bump = $bump
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ball_sprite_2d: Sprite2D = $ballSprite2D

var pos = global_position
var speed = Vector2(350,450)
var col
var spawnScale

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.ZERO
	timer.start()
	pos = global_position
	spawnScale = ball_sprite_2d.scale

func _physics_process(delta):
	col = move_and_collide(velocity * delta)
	if col:
		animation_player.play("bounce")
		ball_sprite_2d.rotation = -col.get_normal().angle()
		velocity = velocity.bounce(col.get_normal())
		bump.play()

func _process(delta: float) -> void:
	velocityBasedScale()
	
func resetBall():
	position = pos
	velocity = Vector2.ZERO
	timer.start()

func velocityBasedScale():
	if animation_player.is_playing():
		pass
	ball_sprite_2d.scale = lerp(spawnScale,spawnScale * Vector2(1.4,0.5),velocity.length()/1600)
	ball_sprite_2d.rotation = velocity.angle()

func _on_timer_timeout():
	velocity = speed
