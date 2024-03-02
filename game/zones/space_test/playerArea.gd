extends CollisionShape3D

#signal to play music
signal combatMusicPlay

var enemy = null
#var enemy_two = null
var player = null
var music_node = null

@export var enemyFound : NodePath 

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("XROrigin3D")
	enemy = get_node("World/chaser")
	#enemy_two = get_node("World/chaser2")
	music_node = get_node("World/music/combat")
	
	connect("combatMusicPlay", music_node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_position = player.global_position
	var enemy_position = enemy.global_position
	#var other_enemy_position = enemy_two.global_position
	
	#find distance between enemy and player
	var distance = player_position.distance_to(enemy_position)
	if distance < 5:
		emit_signal("combatMusicPlay")
