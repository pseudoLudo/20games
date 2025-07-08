extends Node2D
@onready var label = $Label
@onready var timer = $Timer

func _ready():
	label.text = "Final Score : " + str(Globals.score)
	timer.start()


func _on_timer_timeout():
	Globals.lives = 5
	Globals.score = 0
	get_tree().change_scene_to_file("res://opening.tscn")
