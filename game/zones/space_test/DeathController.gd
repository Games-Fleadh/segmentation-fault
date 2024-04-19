extends Node3D
@export var teleporter : Node3D
@export var player : Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(180).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player.global_position = teleporter.global_position
