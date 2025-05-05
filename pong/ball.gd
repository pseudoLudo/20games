extends Area2D

@export var x_speed : float = 400
@export var y_speed : float = 300

func _process(delta: float) -> void:
	position.x += x_speed * delta
	position.y += y_speed * delta
	
	screenBounds()
	print(position)

func screenBounds():
	if position.x <= 0 :
		Manager.emit_signal("playerpoint")
	if position.x >= get_viewport_rect().size.x:
		Manager.comppoint.emit()
		get_tree().reload_current_scene()
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		y_speed = -y_speed
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_paddle"):
		x_speed = -x_speed
	if area.is_in_group("enemy_paddle"):
		x_speed = -x_speed
