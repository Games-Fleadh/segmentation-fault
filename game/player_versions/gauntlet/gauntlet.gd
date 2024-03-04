extends Node3D
@onready var _controller := XRHelpers.get_xr_controller(self)
var buttonPressed = false
var state = "State 1"
var colorAnimator
var wristUI
var playerHealth = 100
var playerBody
var collisionsList

# var _scene_base : XRToolsSceneBase

# Called when the node enters the scene tree for the first time.
func _ready():
	colorAnimator = get_node("AnimationPlayer")
	wristUI = get_parent().get_node("WristUI")
	playerBody = get_parent().get_parent().get_parent().get_node("PlayerBody")
	$TelekinesisPoint.set_process(false)
	$SwordSpawn.set_process(true)
	# _scene_base = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Getting list of collisions for player body, checking if enemy is in them.
	collisionsList = playerBody.get_slide_collision_count()
	for body in collisionsList:
		var collision = playerBody.get_slide_collision(body)
		#Removing 1 health each frame an enemy is in contact with the player.
		if collision.get_collider().name.begins_with("chaser"):
			playerHealth -= 1
	
	#Updating wrist UI with HP value.
	wristUI.scene_node.get_child(0).get_child(0).get_child(0).set_text("Health: " + str(playerHealth) + "/100")
	
	#Check if button pressed and in Sword state, switch to Telekinesis.
	if _controller.is_button_pressed("by_button") && buttonPressed == false && state == "State 1":
		print("Now in State 2")
		state = "State 2"
		wristUI.scene_node.get_child(0).get_child(1).get_child(0).set_text("Telekinesis")
		buttonPressed = true
		colorAnimator.play("gauntletLib/toTelekinesis")
		$SwordSpawn.set_process(false)
		$TelekinesisPoint.set_enabled(true)
		$TelekinesisPoint.set_process(true)

	#Check if button pressed and in Telekinesis state, switch to Sword.
	if _controller.is_button_pressed("by_button") && buttonPressed == false && state == "State 2":
		print("Now in State 1")
		state = "State 1"
		wristUI.scene_node.get_child(0).get_child(1).get_child(0).set_text("Summon Sword")
		buttonPressed = true
		colorAnimator.play("gauntletLib/toSword")
		$TelekinesisPoint.set_enabled(false)
		$TelekinesisPoint.set_process(false)
		$SwordSpawn.set_process(true)

	#Reset button after it is pressed.
	if !_controller.is_button_pressed("by_button"):
		buttonPressed = false
