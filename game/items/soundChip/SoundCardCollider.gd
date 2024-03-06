extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	#first 0 is the master bus, -80 is the volume level, so it turns them off
	AudioServer.set_bus_volume_db(0,-80)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#when the audio chip collides with the gauntlet slot collider, restore all sound
func _on_body_entered(body):
	if(body.name == "audioChip"):
		print("AAAAAAH")
		AudioServer.set_bus_volume_db(0,0)
