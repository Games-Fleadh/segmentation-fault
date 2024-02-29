extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
		# Clear the viewport.
	var viewport = $SubViewport
	$SubViewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

	# Retrieve the texture and set it to the viewport quad.
	$ViewportQuad.material_override.albedo_texture = viewport.get_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
