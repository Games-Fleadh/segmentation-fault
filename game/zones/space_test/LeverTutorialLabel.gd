extends Label3D

@export var player : Node


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	var distance = (global_position - player.global_position )
	if(distance.length() < 15):
		visible = true # Replace with function body.
	


func _on_area_3d_body_exited(body):
	visible = false # Replace with function body.
