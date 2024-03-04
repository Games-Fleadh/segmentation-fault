extends Node3D
var swordScene = preload("res://game/items/swords/finnsword/finnsword.tscn")
@onready var controller := XRHelpers.get_xr_controller(self)
var buttonPressed = false
var world
var swordInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	swordInstance = swordScene.instantiate()
	world = get_node("/root/Main/Scene/Scene")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if controller.is_button_pressed("trigger_click") && buttonPressed == false:
		
		var allSword = get_tree().get_nodes_in_group("swords")
		
		for sword in allSword:
			sword.queue_free()
		
		swordInstance = swordScene.instantiate()
		world.add_child(swordInstance)
		get_node("/root/Main/Scene/Scene/thefinnsword - Textures").position = global_position
		buttonPressed = true
		
		
	if !controller.is_button_pressed("trigger_click"):
		buttonPressed = false
		
	
		
