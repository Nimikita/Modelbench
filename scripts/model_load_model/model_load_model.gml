/// model_load_model(map)
/// @arg map

var map = argument0;

if (!ds_map_valid(map))
	return 0

// Mine-imator checks for model name, texture, and parts, Modelbench doesn't need do

// Model name
model_name = value_get_string(map[?"name"], "")
	
// Root texture
texture_name = value_get_string(map[?"texture"], null)
	
// Texture size
texture_size = value_get_point2D(map[?"texture_size"], point2D(16, 16))
texture_size = vec2(max(texture_size[X], texture_size[Y])) // Make square
	
if (texture_name != null)
{
	res = model_load_texture(texture_name)
	res.scale = value_get_real(map[?"texture_scale"], 1)
}
	
color_inherit = false
color_blend = c_white
color_alpha = 1
color_brightness = 0
color_mix = c_black
color_mix_percent = 0
	
// Allow Minecraft skins
player_skin = value_get_real(map[?"player_skin"], false)
	
// Scale (optional)
scale = value_get_point3D(map[?"scale"], vec3(1))
root_scale = max(scale[X], scale[Y], scale[Z])

if (part_list = null)
	part_list = ds_list_create()
	
// Read parts from root
var partlist = map[?"parts"]
for (var p = 0; p < ds_list_size(partlist); p++)
{
	var part = model_load_part(partlist[|p], id)
	if (part = null)
		return null
	if (part > 0)
		ds_list_add(part_list, part)
}
	
ds_map_destroy(map)
