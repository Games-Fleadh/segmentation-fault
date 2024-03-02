extends AudioStreamPlayer
#
#
## Called when the node enters the scene tree for the first time.
func _ready():
	var combat_song = get_node("World/music/combat")
	var song_file = load("res://game/audio/music/combat.mp3")
	combat_song.stream = song_file
	#$Area3D.connect("combatMusicPlay", playMusic)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
	##pass
#
func playMusic() -> void:
	$combat_song.play()
