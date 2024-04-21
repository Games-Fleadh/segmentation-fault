extends Node3D
var trigger
var slider


# Called when the node enters the scene tree for the first time.
func _ready():
	trigger = false
	slider = get_node("SliderOrigin/XRToolsInteractableSlider")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if slider.slider_position == slider.slider_limit_min:
		trigger = true
