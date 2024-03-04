extends Node3D

var sliderObject
var leftDoorAnim
var rightDoorAnim
var doorOpened = false
@export var playerChar : Node
@export var destination : Vector3
@export_file('*.tscn') var target : String
@export var teleporter : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	sliderObject = get_node("SliderSmooth/SliderOrigin/XRToolsInteractableSlider")
	leftDoorAnim = get_node("DoorLeft/AnimationPlayerLeft")
	rightDoorAnim = get_node("DoorRight/AnimationPlayerRight")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if sliderObject.slider_position == sliderObject.slider_limit_min && leftDoorAnim.is_playing() != true && doorOpened == false:
		teleporter.teleportToScene(target, destination)
		sliderObject.slider_position = 0.4
		
