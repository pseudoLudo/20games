extends Area2D

@export var speed : float = 200
@export var control_up : String 
@export var control_down : String 

func _process(delta: float) -> void:
	control(delta,control_down,control_up)
	screenBound()

func control(delta,cd,cup):
	if Input.is_action_pressed(cd):
		position.y += speed * delta
	if Input.is_action_pressed(cup):
		position.y -= speed * delta
func screenBound():
	position.y = clamp(position.y,60,get_viewport_rect().size.y - 60)
