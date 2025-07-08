extends CanvasLayer

@onready var lives = $lives
@onready var score = $score


func _ready():
	pass # Replace with function body.

func _process(delta):
	lives.text = "Lives : " + str(Globals.lives)
	score.text = "Score : " + str(Globals.score)
