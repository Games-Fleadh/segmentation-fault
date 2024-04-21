extends Node3D

@export var triggerObject : Node
var leftDoorAnim
var rightDoorAnim
var audioPlayer
var doorOpened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	leftDoorAnim = get_node("Left/AnimationPlayerLeft")
	rightDoorAnim = get_node("Right/AnimationPlayerRight")
	audioPlayer = get_node("AudioStreamPlayer3D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if triggerObject != null:
		if triggerObject.trigger == true && leftDoorAnim.is_playing() != true && doorOpened == false:
			leftDoorAnim.play("LeftDoorOpen")
			rightDoorAnim.play("RightDoorOpen")
			audioPlayer.play()
			doorOpened = true
