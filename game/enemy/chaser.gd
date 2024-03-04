extends CharacterBody3D

var player = null
var music = null
var rng = RandomNumberGenerator.new()
var animator
var my_random_number = rng.randf_range(0, 2)
var alive = true

var SPEED : float = 2.5

@export var player_path : NodePath
@onready var nav_agent = $NavigationAgent3D

@export var mus_path : NodePath
@onready var mus_nav_agent = $AudioStreamPlayer

const enemy_detection_distance = 5.0


func _ready():
	
	# Get the player's node.
	player = get_node(player_path)
	
	music = get_node(mus_path)
	
	# Get the animator node, then wait a random delay before playing.
	animator = get_node("AnimationPlayer")
	await get_tree().create_timer(my_random_number).timeout
	animator.play("enemyWalkLib/enemy_stagger")

func _process(_delta):
	
	#new code added to try to trigger combat music
	var distance = (global_position - player.global_position)
	
	if(distance.length() < enemy_detection_distance):
		# Set velocity, move towards player position at that velocity.
		velocity = Vector3.ZERO

		nav_agent.set_target_position(player.global_position)

		var next_nav_point  = nav_agent.get_next_path_position()
		velocity = (next_nav_point - self.global_position).normalized() * SPEED
		
		var allEnemy = get_tree().get_nodes_in_group("enemy")
		
		for i in allEnemy:
			mus_nav_agent.play()


		# Move and Slide function also used to detect collisions.
		move_and_slide()
	
	# Get list of all collisions each frame.
	for i in get_slide_collision_count():
		
		var collision = get_slide_collision(i)
		
		#If colliding with the finn sword, play death animation
		if collision.get_collider().name == "thefinnsword - Textures":
			SPEED = 0
			if alive == true:
				animator.play("enemyWalkLib/death")
			alive = false
			
	
	# If the animator has stopped playing, and you've been killed, die.
	if animator.is_playing() == false && alive == false:
		queue_free()
	
	# Turn to face the player.
	turn_face(player, _delta)

# Turn to face the player.
func turn_face(target, delta):
	var rotation_speed = 3
	var target_pos = target.global_transform.origin
	var pos = global_transform.origin
	target_pos.y = pos.y
	var origin_rot = rotation
	look_at(target_pos, Vector3(0,1,0))
	var target_rot = rotation
	var rot_length = target_rot - origin_rot
	var rot_step = rot_length * rotation_speed * delta
	rotation = origin_rot + rot_step
	
