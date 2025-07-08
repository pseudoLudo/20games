extends Area2D

@onready var sprite_2d = $RigidBody2D/Sprite2D

var colorList = ["EA5604","00A0EA","F08EB8","0EAD67","F39800"]
func _ready():
	sprite_2d.modulate = colorList[randi_range(0, len(colorList) - 1)]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.is_in_group("ball"):
		body.velocity += body.velocity*0.01
		Globals.score += 10
		queue_free()
