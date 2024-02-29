extends AudioStreamPlayer

var enemy = null

# Called when the node enters the scene tree for the first time.
func _ready():
	#get enemy node, chaser (hopefully)
	enemy = get_node("/root/SpaceZone/World/chaser")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#check if enemy is detected 
	#nothing here works
	if enemy.is_detected():
		#play combat music and stop main music
		$combat.play()
		$main.stop()
	else:
		#no enemy so play music
		$main.play()
		$combat.stop()
