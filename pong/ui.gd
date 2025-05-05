extends Control

@onready var c_1: Label = $MarginContainer/c1
@onready var p_1: Label = $MarginContainer/p1


func _ready() -> void:
	Manager.playerpoint.connect(displayerScore)
	Manager.playerpoint.connect(displayCompScore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func displayerScore():
	p_1.text = str(Manager.playerScore)
	
func displayCompScore():
	c_1.text = str(Manager.compScore)
