extends Node

var score = 0
#signals
signal scored
signal pipecollision

func _ready() -> void:
	scored.connect(scoreupdate)

func scoreupdate():
	score += 1
	print(score)
	
