/// background_ground_startup()
/// @desc Creates the vbuffer(s) for drawing the ground.

function background_ground_startup()
{
	var size, maincolor, secondarycolor;
	
	log("Ground vbuffer init")
	
	size = 192
	maincolor = c_text_main
	secondarycolor = c_background
	
	vertex_rgb = c_white
	
	// Axis divide line
	background_ground_axis_vbuffer = vbuffer_start()
	vertex_add(vec3(0), vec3(0), vec2(0))
	vertex_add(point3D(-16 * 8, 0, 0), vec3(0), vec2(0))
	vertex_add(point3D(16 * 8, 0, 0), vec3(0), vec2(0))
	vbuffer_done(null, false)
	
	// Ground arrow
	background_ground_arrow_vbuffer = vbuffer_start()
	vertex_add(vec3(0), vec3(0), vec2(0))
	
	vertex_add(point3D(8 * -2.5, -8 * 3, 0), vec3(0), vec2(0)) // Bottom
	vertex_add(point3D(8 * -2.5, 8 * 3, 0), vec3(0), vec2(0))
	
	vertex_add(point3D(8 * -2.5, -8 * 3, 0), vec3(0), vec2(0)) // Right
	vertex_add(point3D(8 * 2.5, 0, 0), vec3(0), vec2(0))
	
	vertex_add(point3D(8 * -2.5, 8 * 3, 0), vec3(0), vec2(0)) // Left
	vertex_add(point3D(8 * 2.5, 0, 0), vec3(0), vec2(0))
	
	vbuffer_done(null, false)
	
	// Ground 'X'
	background_ground_x_vbuffer = vbuffer_start()
	vertex_add(vec3(0), vec3(0), vec2(0))
	vbuffer_add_line(point3D(-4, -4, 0), point3D(4, 4, 0))
	vbuffer_add_line(point3D(4, -4, 0), point3D(-4, 4, 0))
	vbuffer_done(null, false)
	
	// Ground 'Y'
	background_ground_y_vbuffer = vbuffer_start()
	vertex_add(vec3(0), vec3(0), vec2(0))
	vbuffer_add_line(point3D(0, 0, 0), point3D(-4, 0, 0))
	vbuffer_add_line(point3D(0, 0, 0), point3D(4, -4, 0))
	vbuffer_add_line(point3D(0, 0, 0), point3D(4, 4, 0))
	vbuffer_done(null, false)
	
	// Ground 'Z'
	background_ground_z_vbuffer = vbuffer_start()
	vertex_add(vec3(0), vec3(0), vec2(0))
	vbuffer_add_line(point3D(-4, -4, 0), point3D(-4, 4, 0))
	vbuffer_add_line(point3D(-4, -4, 0), point3D(4, 4, 0))
	vbuffer_add_line(point3D(4, -4, 0), point3D(4, 4, 0))
	vbuffer_done(null, false)
	
	// Grid ground
	vertex_rgb = c_black
	background_ground_vbuffer = vbuffer_start()
	vertex_add(vec3(0), vec3(0), vec2(0))
	
	vertex_rgb = c_dkgray
	
	for (var i = -16; i < 17; i++)
	{
		if (i = 0)
			continue
		
		vertex_add(point3D(-16 * 8, i * 8, 0), vec3(0), vec2(0))
		vertex_add(point3D(16 * 8, i * 8, 0), vec3(0), vec2(0))
	}
	
	for (var i = -16; i < 17; i++)
	{
		if (i = 0)
			continue
		
		vertex_add(point3D(i * 8, -16 * 8, 0), vec3(0), vec2(0))
		vertex_add(point3D(i * 8, 16 * 8, 0), vec3(0), vec2(0))
	}
	
	vbuffer_done(null, false)
	
	vertex_rgb = c_white
}
