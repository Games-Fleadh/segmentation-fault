extends XRCamera3D

var vr_camera # Reference to the VR camera or controller

func _ready():
	# Get reference to the VR camera or controller (adjust as necessary)
	vr_camera = get_node("XROrigin3D/XRCamera3D")

	# Attach the dialogue balloon UI to the VR camera or controller
	$DialogueBalloon.set_parent(vr_camera)
	# Call the Intro Dialogue Script
	#DialogueManager.show_dialogue_balloon(load("res://writing/Intro.dialogue"), "Intro")

func _process(delta):
	# Update the position of the dialogue balloon UI to stay in front of the camera or controller
	$DialogueBalloon.transform.origin = vr_camera.transform.origin + vr_camera.transform.basis.z * 2.0

