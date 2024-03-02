extends XRCamera3D

var vr_camera # Reference to the VR camera or controller

func _ready():
	# Get reference to the VR camera or controller (adjust as necessary)
	vr_camera = get_node("/root/SpaceZone/XROrigin3D/XRCamera3D")

func _process(delta):
	pass
	# Update the position of the dialogue balloon UI to stay in front of the camera or controller
	# %BalloonControl.transform.origin = vr_camera.transform.origin + vr_camera.basis.z * 2.0
