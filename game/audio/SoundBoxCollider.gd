extends Node3D
@export var event : Node
@export var rigidbody : Node
@export var screenText : Node
var handInside
var progress
var complete


# Called when the node enters the scene tree for the first time.
func _ready():
	#first 0 is the master bus, -80 is the volume level, so it turns them off
	AudioServer.set_bus_volume_db(0,-80)
	handInside = false
	complete = false
	progress = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if handInside == true:
		progress += 1
		
	if progress > 300 && event.flag1 == false:
		complete = true
		screenText.set_text("Upload Complete!")
		event.flag1 = true
		AudioServer.set_bus_volume_db(0,0)

#when the audio chip collides with the gauntlet slot collider, restore all sound
func _on_detection_body_body_entered(body):
	if body.name == "CollisionHandRight" && complete == false && event.flag2 == true:
		handInside = true
		screenText.set_text("Uploading Audio 
Software...")
		


func _on_detection_body_body_exited(body):
	if body.name == "CollisionHandRight" && complete == false && event.flag2 == true:
		handInside = false
		screenText.set_text("Awaiting Gauntlet 
Insertion...")

