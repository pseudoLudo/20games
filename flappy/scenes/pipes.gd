extends Node2D

@export var speed : float
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x <= -300:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Manager.scored.emit()
		collision_shape_2d.call_deferred("set_disabled",true)


func _on_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Manager.pipecollision.emit()
