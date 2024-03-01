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
	if _controller.is_button_pressed("by_button") && buttonPressed == false && state == "State 1":
		print("Now in State 2")
		state = "State 2"
		buttonPressed = true
		colorAnimator.play("gauntletLib/toTelekinesis")
		$SwordSpawn.set_process(false)
		$TelekinesisPoint.set_process(true)

	if _controller.is_button_pressed("by_button") && buttonPressed == false && state == "State 2":
		print("Now in State 1")
		state = "State 1"
		buttonPressed = true
		colorAnimator.play("gauntletLib/toSword")
		$TelekinesisPoint.set_process(false)
		$SwordSpawn.set_process(true)
		

	if !_controller.is_button_pressed("by_button"):
		buttonPressed = false



