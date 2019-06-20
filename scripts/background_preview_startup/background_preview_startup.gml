/// background_preview_startup()
/// @desc Creates the vbuffer(s) for drawing the ground.

background_color_light = c_white
background_color_dark = c_white

background_preview_ground_vbuffer = vbuffer_create_surface(2500, vec2(0), vec2(0), false)
background_preview_sky_vbuffer = vbuffer_create_sphere(2500, vec2(0), vec2(0), 64, true)
