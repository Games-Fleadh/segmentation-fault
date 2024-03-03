extends Node3D

@onready var _controller := XRHelpers.get_xr_controller(self)
var buttonPressed = false
var state = "State 1"
var colorAnimator

# Called when the node enters the scene tree for the first time.
func _ready():
	colorAnimator = get_node("AnimationPlayer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _controller.is_button_pressed("ax_button") && buttonPressed == false && state == "State 1":
		print("Now in State 2")
		state = "State 2"
		buttonPressed = true
		colorAnimator.play("gauntletLib/toTelekinesis")

	if _controller.is_button_pressed("ax_button") && buttonPressed == false && state == "State 2":
		print("Now in State 1")
		state = "State 1"
		buttonPressed = true
		colorAnimator.play("gauntletLib/toSword")

	if !_controller.is_button_pressed("ax_button"):
		buttonPressed = false



