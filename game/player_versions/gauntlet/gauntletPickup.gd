extends Node3D
@export var RightHand : Node
@export var events : Node
var gauntletScene = preload("res://game/player_versions/gauntlet/NewGauntlet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.name == "CollisionHandRight":
		var gauntletInstance = gauntletScene.instantiate()
		RightHand.add_child(gauntletInstance)
		#RightHand.get_node("Gauntlet").global_position = RightHand.global_position + Vector3(0.038, -0.058, 0.285)
		events.flag2 = true
		queue_free()
