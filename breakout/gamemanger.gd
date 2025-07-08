extends Node2D
@onready var deathzone = $deathzone
@onready var pad = $"../pad"
@onready var bricks = $"../bricks"
@onready var exp = $exp

var brickno
func _ready():
	brickno = bricks.get_child_count()

func _on_deathzone_body_entered(body):
	body.resetBall()
	pad.padReset()
	Globals.lives -= 1
	
func _process(delta):
	if bricks.get_child_count() <= 0:
		get_tree().change_scene_to_file("res://playarea2.tscn")
	if Input.is_action_just_released("reset"):
		get_tree().reload_current_scene()
	if Globals.lives <= 0:
		get_tree().change_scene_to_file("res://final.tscn")
	if brickno > bricks.get_child_count():
		exp.play()
		brickno = bricks.get_child_count()
		
