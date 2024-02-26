extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#music for combat, to be played while combat is going on. just remember to do a while loop because it doesnt loop
#would be a while loop probably and then checks if audio is playing, if it's not playing, play music
func _combat_music() -> void: pass
