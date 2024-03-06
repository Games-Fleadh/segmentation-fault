extends Node3D
@export var player : Node
var gauntlet

# Called when the node enters the scene tree for the first time.
func _ready():
	gauntlet = player.get_child(2).get_child(0).get_child(8)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_vial_picked_up(pickable):
	gauntlet.maxHealth += 20
	gauntlet.playerHealth = gauntlet.maxHealth
	get_parent().queue_free()
