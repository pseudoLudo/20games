extends Area2D
@onready var ball: Area2D = $"../ball"
@export var speed : float

func _process(delta: float) -> void:
	if sign(ball.position.y - position.y) >= 0:
		position.y += abs(speed) * delta
	if sign(ball.position.y - position.y) <= 0:
		position.y -= abs(speed) * delta
	position.y = clamp(position.y,60,get_viewport_rect().size.y - 60)
