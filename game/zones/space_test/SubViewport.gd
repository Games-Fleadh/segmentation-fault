extends SubViewport


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://writing/Intro.dialogue"), "Intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
