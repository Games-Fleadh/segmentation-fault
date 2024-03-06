extends RigidBody3D
@export var playerBody : Node
var gauntletScene = preload("res://game/player_versions/gauntlet/gauntlet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.name == "RightHand":
		var gauntletInstance = gauntletScene.instantiate()
		playerBody.get_node("RightHand").get_node("CollisionHandRight").add_child(gauntletInstance)
		queue_free()
