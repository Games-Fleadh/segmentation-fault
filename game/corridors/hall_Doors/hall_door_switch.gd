extends Node3D

var sliderObject
var leftDoorAnim
var rightDoorAnim
var doorOpened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sliderObject = get_node("SliderSmooth/SliderOrigin/XRToolsInteractableSlider")
	leftDoorAnim = get_node("DoorLeft/AnimationPlayerLeft")
	rightDoorAnim = get_node("DoorRight/AnimationPlayerRight")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if sliderObject.slider_position == sliderObject.slider_limit_min && leftDoorAnim.is_playing() != true && doorOpened == false:
		leftDoorAnim.play("LeftDoorOpen")
		rightDoorAnim.play("RightDoorOpen")
		doorOpened = true
