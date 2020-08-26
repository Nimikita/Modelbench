/// action_preview_scenery(scenery)
/// @arg scenery

setting_preview_scenery = argument0
setting_preview_background_top = setting_preview_scenery.background_top
setting_preview_background_bottom = setting_preview_scenery.background_bottom
setting_preview_ambient_color = setting_preview_scenery.ambient_color

setting_preview_light_color[0] = setting_preview_scenery.light_color[0]
setting_preview_light_color[1] = setting_preview_scenery.light_color[1]
setting_preview_light_color[2] = setting_preview_scenery.light_color[2]
setting_preview_lights = 0

setting_preview_cubemap_sprite = setting_preview_scenery.cubemap_sprite
setting_preview_cubemap_repeat = setting_preview_scenery.cubemap_repeat
setting_preview_cubemap_mapped = setting_preview_scenery.cubemap_mapped

if (setting_preview_cubemap_sprite != null)
{
	if (background_cube_vbuffer != null)
		vbuffer_destroy(background_cube_vbuffer)
	
	background_cube_vbuffer = vbuffer_create_cube(1, vec2(0), vec2(setting_preview_cubemap_repeat), false, false, true, setting_preview_cubemap_mapped)
}

for (var i = 0; i < 3; i++)
{
	if (setting_preview_light_color[i] != c_black)
		setting_preview_lights++
}
