extends Node3D
var introDefault = "Welcome back to consciousness!
My name is PAL. 

If you can hear me, press
the 'A' button to jump."

var leverDefault = "Use the grip button
to grab the lever and 
pull it down!

You won't be able to
open the door until
you install the audio
drivers on the table!"

var audioDefault = "Grab your GAUNTLET from the table here!
It will allow you to defend yourself, 
and overcome obstacles."

var uhOhDefault = "Uh Oh! 
Those 'Exceptions' are hard-light projections that want you dead.
Use the 'TRIGGER' button
to summon a hard-light sword.
Mind your health!"

var telekinesisDefault = "Use the 'B' button to switch your
gauntlet to telekinesis mode."

@export var TCleft : Node
@export var TCright : Node
@export var normalMat : Material
@export var invisMat : Material
@export var highlightMat : Material
@export var events : Node
@export var leftController: XRController3D
@export var rightController: XRController3D
@export var podVial : Node
@export var firstLever : Node

var tutorialSequencer = 0

var AbuttonPressed = false
var BbuttonPressed = false
var XbuttonPressed = false
var YbuttonPressed = false

var LgripPressed = false
var RgripPressed = false
var LtriggerPressed = false
var RtriggerPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Labels/IntroLabel.set_text(introDefault)
	$Labels/LeverTutorialLabel.set_text(leverDefault)
	$Labels/UhOhLabel.set_text(uhOhDefault)
	$Labels/AudioLabel.set_text(audioDefault)
	$Labels/TelekinesisLabel.set_text(telekinesisDefault)
	setAllMaterials(TCright, normalMat)
	setMaterial(TCright, highlightMat, 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if tutorialSequencer == 0 && rightController.is_button_pressed("ax_button") && AbuttonPressed == false:
		$Labels/IntroLabel.set_text("Great! Now try pressing 'Y' to crouch.")
		AbuttonPressed = true
		tutorialSequencer = 1
		setAllMaterials(TCright, invisMat)
		setAllMaterials(TCleft, normalMat)
		setMaterial(TCleft, highlightMat, 3)
		
		
	if tutorialSequencer == 1 && leftController.is_button_pressed("by_button") && YbuttonPressed == false:
		$Labels/IntroLabel.set_text("Wonderful! Now, lastly, use the 'GRIP'
		button to grab that vial, and heal
		yourself enough to leave the pod.
		
		Then you can grab your GAUNTLET from that table!")
		YbuttonPressed = true
		tutorialSequencer = 2
		setAllMaterials(TCright, normalMat)
		setAllMaterials(TCleft, normalMat)
		setMaterial(TCleft, highlightMat, 5)
		setMaterial(TCright, highlightMat, 5)
		podVial.enabled = true
		
	
	if tutorialSequencer == 2 && events.flag3 == true:
		podVial = null
		$Labels/IntroLabel.set_text("")
		tutorialSequencer = 3
		setAllMaterials(TCright, invisMat)
		setAllMaterials(TCleft, invisMat)
		
		
	if tutorialSequencer == 3 && events.flag2 == true:
		$Labels/AudioLabel.set_text("Great! Now you have your
		gauntlet, put your arm into the machine there.
		
		It will reinstall suit's audio software and allow you to hear.")
		tutorialSequencer = 4
		
		
	if tutorialSequencer == 4 && events.flag1 == true:
		$Labels/AudioLabel.set_text("")
		tutorialSequencer = 5
		
		
	if tutorialSequencer == 5:
		$Labels/LeverTutorialLabel.set_text("Now you have your hearing
		back, use the grip button to
		pull down the level and open the door.")
		tutorialSequencer = 6
		setAllMaterials(TCright, normalMat)
		setAllMaterials(TCleft, normalMat)
		setMaterial(TCleft, highlightMat, 5)
		setMaterial(TCright, highlightMat, 5)
		
		
	if tutorialSequencer == 6 && firstLever.trigger == true:
		$Labels/LeverTutorialLabel.set_text("")
		tutorialSequencer = 7
		setAllMaterials(TCright, normalMat)
		setAllMaterials(TCleft, invisMat)
		setMaterial(TCright, highlightMat, 6)
		
		
	if tutorialSequencer == 7 && rightController.is_button_pressed("trigger_click") && RtriggerPressed == false:
		RtriggerPressed = true
		$Labels/UhOhLabel.set_text("")
		tutorialSequencer = 8
		setAllMaterials(TCright, invisMat)
		setAllMaterials(TCleft, invisMat)
		
		
	if tutorialSequencer == 8 && rightController.global_position.distance_to($Labels/TelekinesisLabel.global_position) < 10:
		setAllMaterials(TCright, normalMat)
		setMaterial(TCright, highlightMat, 3)
		tutorialSequencer = 9
		
		
	if tutorialSequencer == 9 && rightController.is_button_pressed("by_button") && BbuttonPressed == false:
		setMaterial(TCright, normalMat, 3)
		setMaterial(TCright, highlightMat, 6)
		tutorialSequencer = 10
		BbuttonPressed = true
		$Labels/TelekinesisLabel.set_text("Excellent!
		Now point your beam at the crates and hold
		'TRIGGER' to lift them out of the way.")
		
		
	if tutorialSequencer == 10 && rightController.is_button_pressed("trigger_click") && RtriggerPressed == false:
		setAllMaterials(TCright, invisMat)
		setAllMaterials(TCleft, invisMat)
		$Labels/TelekinesisLabel.set_text("")
		tutorialSequencer = 11
		RtriggerPressed = true
	
	
	
	resetButtons()
	
	
func setAllMaterials(mesh, material):
	mesh.set_surface_override_material(0, material)
	mesh.set_surface_override_material(1, material)
	mesh.set_surface_override_material(2, material)
	mesh.set_surface_override_material(3, material)
	mesh.set_surface_override_material(4, material)
	mesh.set_surface_override_material(5, material)
	mesh.set_surface_override_material(6, material)
	
func setMaterial(mesh, material, part):
	"""
	0 - Base
	1 - Joystick
	2 - Menu
	3 - UpperButton
	4 - LowerButton
	5 - Grip
	6 - Trigger
	"""
	mesh.set_surface_override_material(part, material)
	
func resetButtons():
	if !leftController.is_button_pressed("ax_button"):
		XbuttonPressed = false
		
	if !leftController.is_button_pressed("by_button"):
		YbuttonPressed = false
		
	if !rightController.is_button_pressed("ax_button"):
		AbuttonPressed = false
		
	if !rightController.is_button_pressed("by_button"):
		BbuttonPressed = false
		
	if !leftController.is_button_pressed("trigger_click"):
		LtriggerPressed = false
		
	if !rightController.is_button_pressed("trigger_click"):
		RtriggerPressed = false
		
	if !leftController.is_button_pressed("grip_click"):
		LgripPressed = false
		
	if !rightController.is_button_pressed("grip_click"):
		RgripPressed = false
