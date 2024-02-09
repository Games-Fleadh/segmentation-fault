extends CharacterBody3D



var player = null

const SPEED : float = 1.0

@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D



func _ready():
	push_warning("player_path ::::: ", player_path)
	player = get_node("/root/World/Player")
	push_warning("player", player)

func _process(_delta):
	velocity = Vector3.ZERO
	
	nav_agent.set_target_position(player.global_position)
	var next_nav_point  = nav_agent.get_next_path_position()
	self.velocity = (player.global_position - self.global_position).normalized() * SPEED
	push_warning(next_nav_point, self.global_position, velocity)
	move_and_slide()
	
	
		
