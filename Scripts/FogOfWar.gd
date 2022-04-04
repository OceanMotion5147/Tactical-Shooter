extends Node2D

var node_VPFog
var fog_tex_upperleft = Vector2(0.0, 0.0)
var fog_tex_scale = Vector2(1.0, 1.0)

func _ready():
	node_VPFog = $viewportFog/Fog
	pass
	
func set_clear_texture_path(clear_image_path, clear_image_scale):
	node_VPFog.set_clear_texture_path(clear_image_path, clear_image_scale)
	
func set_fog_color(fog_color):
	node_VPFog.set_fog_color(fog_color)
	
func level_start(fog_size, fog_upperleft, fog_texture_scale):
	fog_tex_upperleft = fog_upperleft
	fog_tex_scale = fog_texture_scale
	
	self.position = fog_tex_upperleft
	self.scale = Vector2(1.0/ fog_tex_scale.x, 1.0/ fog_tex_scale.y)
	node_VPFog.level_start(fog_size * fog_texture_scale, fog_tex_scale)
	
func set_clear_position(clear_position_new):
	node_VPFog.set_clear_position((clear_position_new - fog_tex_upperleft) * fog_tex_scale)
