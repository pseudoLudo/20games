extends Node

var playerScore = 0
var compScore = 0

signal playerpoint
signal comppoint

func _ready() -> void:
	Manager.playerpoint.connect(addplayerScore)
	Manager.comppoint.connect(addCompScore)

func addplayerScore():
	playerScore += 1
	
	
func addCompScore():
	compScore += 1
	print(compScore)
