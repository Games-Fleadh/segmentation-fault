extends Node3D
@export var podDoor : Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_vial_picked_up(pickable):
	podDoor.freeze = false
	podDoor.collision_layer = 1
	podDoor.collision_mask = 1
	podDoor.global_position = (Vector3(podDoor.global_position.x, podDoor.global_position.y, podDoor.global_position.z + 0.1))
	podDoor.apply_central_impulse(Vector3(0, 0, 10))
	print("Vial picked up: Trigger.")
	get_parent().queue_free()
