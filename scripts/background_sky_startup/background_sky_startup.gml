/// background_sky_startup()
/// @desc Creates the vbuffer for drawing the sky.

function background_sky_startup()
{
	log("Sky vbuffer init")
	
	background_sky_vbuffer = vbuffer_create_sphere(1, vec2(0), vec2(1), 16, true)
	background_cube_vbuffer = null
}
