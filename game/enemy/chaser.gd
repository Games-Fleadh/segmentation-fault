extends CharacterBody3D

var player = null
var animator
var rng = RandomNumberGenerator.new()
var my_random_number = rng.randf_range(0, 2)

const SPEED : float = 2.5

@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D


func _ready():
	push_warning("player_path ::::: ", player_path)
	player = get_node(player_path)
	push_warning("player", player)

	animator = get_node("AnimationPlayer")
	await get_tree().create_timer(my_random_number).timeout
	animator.play("enemyWalkLib/enemy_stagger")

func _process(_delta):
	velocity = Vector3.ZERO
	
	nav_agent.set_target_position(player.global_position)
	push_warning()
	var next_nav_point  = nav_agent.get_next_path_position()
	velocity = (next_nav_point - self.global_position).normalized() * SPEED

	push_warning(next_nav_point, self.global_position, velocity)

	move_and_slide()
	for i in get_slide_collision_count():
		
		var collision = get_slide_collision(i)
		print("I collided with ", collision.get_collider().name)
		
		if collision.get_collider().name == "thefinnsword - Textures":
			queue_free()
		
		

	turn_face(player, _delta)


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
	
