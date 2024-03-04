extends Node3D
var wristUI

# Called when the node enters the scene tree for the first time.
func _ready():
	wristUI = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(wristUI.scene_node.get_child(0).get_child(0).get_child(0).name)
	wristUI.scene_node.get_child(0).get_child(0).get_child(0).set_text("Killing you")
