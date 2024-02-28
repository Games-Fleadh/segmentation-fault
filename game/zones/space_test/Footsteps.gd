extends Node3D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	var footstep_script = load("res://addons/godot-xr-tools/functions/movement_footstep.gd")
	var sound_name = "Footstep"
	var audio_stream = preload("res://game/audio/sound/footstep 1.wav")
	var pitch = 1.0
	
	footstep_script._play_sound(sound_name,audio_stream,pitch)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
