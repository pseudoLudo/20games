extends Node2D

@onready var upper: Marker2D = $upper
@onready var lower: Marker2D = $lower
@onready var timer: Timer = $Timer
const PIPES = preload("res://scenes/pipes.tscn")

func _on_timer_timeout() -> void:
	var c = PIPES.instantiate()
	add_child(c)
	c.position = Vector2(upper.position.x,randf_range(lower.position.y,upper.position.y))
  
