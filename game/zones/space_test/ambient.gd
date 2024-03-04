extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#first 0 is the master bus, -80 is the volume level
	AudioServer.set_bus_volume_db(0, -80)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

