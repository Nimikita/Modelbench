/// preview_update_cubemap()

if (setting_preview_cubemap_sprite != null)
{
	if (background_cube_vbuffer != null)
		vbuffer_destroy(background_cube_vbuffer)
	
	if (setting_preview_cubemap_mapped)
		background_cube_vbuffer = vbuffer_create_cube(1, point2D(0, 0), point2D(1, 1), -1, 1, true, true)
	else
		background_cube_vbuffer = vbuffer_create_cube(1, vec2(0), vec2(setting_preview_cubemap_repeat), false, false, true, false)
}

setting_preview_cubemap_update = false
