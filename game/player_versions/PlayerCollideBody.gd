extends RigidBody3D
var playerNode
var collisionList

# Called when the node enters the scene tree for the first time.
func _ready():
	playerNode = get_node("root/Scene/XROrigin3D/PlayerBody")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	collisionList = get_colliding_bodies()
	for i in collisionList:
		print(i.name)


func _on_body_entered(body : Node):
	print("Collision Detected: " + body.name)
	

