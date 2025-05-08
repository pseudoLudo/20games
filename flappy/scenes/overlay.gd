extends Control

@onready var score: Label = $MarginContainer/Panel/VBoxContainer/score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	Manager.pipecollision.connect(gameover)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") and visible:
		get_tree().reload_current_scene()

func gameover():
	visible = true
	score.text = str("Score: %s" % Manager.score)
