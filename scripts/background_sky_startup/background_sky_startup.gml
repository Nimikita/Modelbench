/// background_sky_startup()
/// @desc Creates the vbuffer for drawing the sky.

log("Sky vbuffer init")

background_sky_vbuffer = vbuffer_create_sphere(1, vec2(0), vec2(1), 16, true)
//background_sphere_vbuffer = vbuffer_create_sphere(8, vec2(0), vec2(1), 16, false)
//background_cube_vbuffer = vbuffer_create_cube(8, vec2(0), vec2(1), false, false, false, false)