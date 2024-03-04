extends NavigationRegion3D

var exception = null

@export var com : NodePath
@onready var cmp = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	exception = get_node(com)
	#push_warning(playCombat())
	$CharacterBody3D.connect("combatMusicPlay", _on_chaser_5_combat_music_play)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

#func playCombat():
	#$AudioStreamPlayer.play()


func _on_chaser_5_combat_music_play():
	$AudioStreamPlayer.play()
