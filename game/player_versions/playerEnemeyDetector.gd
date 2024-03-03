extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = get_node("/root/Scene/XROrigin3D").global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_node("/root/Scene/XROrigin3D").global_position


func _on_body_entered(body):
	print(body.name)
