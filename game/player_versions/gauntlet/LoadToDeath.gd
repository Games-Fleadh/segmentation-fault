class_name DeathTrigger
extends XRToolsSceneBase


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Access player health from parent, load to main menu if less than 0.
	if get_parent().playerHealth < 0:
		print("Rats")
		load_scene("res://game/start_scene/start_scene.tscn")
