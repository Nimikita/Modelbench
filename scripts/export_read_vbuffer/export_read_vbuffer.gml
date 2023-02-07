/// export_read_vbuffer()

function export_read_vbuffer()
{
	var vbuffer, size, p, uv;
	vbuffer = shape_vbuffer
	size = vertex_get_number(vbuffer)
	
	// Empty
	if (size < 4)
		return 0
	
	// Create lists
	if (shape_export_position_list = null)
	{
		shape_export_position_list = ds_list_create()
		shape_export_uv_list = ds_list_create()
		shape_export_vertex_list = ds_list_create()
		
		shape_unique_position_list = ds_list_create()
		shape_unique_uv_list = ds_list_create()
		
		if (debug_export_normals)
		{
			shape_export_normal_list = ds_list_create()
			shape_unique_normal_list = ds_list_create()
		}
	}
	
	// Get matrix
	var mat = matrix_create(point3D(0, 0, 0), point3D(0, 0, 90), vec3(1/8));
	
	if (app.export_unparent_parts)
		mat = matrix_multiply(matrix, mat)
	else
		mat = matrix_multiply(matrix_multiply(matrix, parent.matrix_parent), mat)
	
	// Get buffer data
	var vertex_data = buffer_create_from_vertex_buffer(vbuffer, buffer_grow, 1);
	
	// Read vertices
	for (var i = 0; i < size; i++)
	{
		// Position
		p[X] = buffer_read(vertex_data, buffer_f32)
		p[Y] = buffer_read(vertex_data, buffer_f32)
		p[Z] = buffer_read(vertex_data, buffer_f32)
		
		// Multiply by mat
		p = point3D_mul_matrix(p, mat)
		
		// Normal
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		
		// Color + Alpha
		buffer_read(vertex_data, buffer_u32)
		
		// UV
		uv[X] = buffer_read(vertex_data, buffer_f32)
		uv[Y] = 1 - buffer_read(vertex_data, buffer_f32)
		
		// Custom
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		
		// Tangent
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		buffer_read(vertex_data, buffer_f32)
		
		// First triangle is empty
		if (i < 3)
			continue
		
		ds_list_add(shape_export_position_list, [p[X], p[Z], p[Y]])
		ds_list_add(shape_export_uv_list, [uv[X], uv[Y]])
		ds_list_add(shape_export_vertex_list, [null, null, null])
	}
	
	buffer_delete(vertex_data)
}