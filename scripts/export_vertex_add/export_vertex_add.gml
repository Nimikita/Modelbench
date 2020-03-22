/// export_vertex_add(pos, normal, uv)
/// @arg pos
/// @arg normal
/// @arg uv

var pos, normal, uv;
pos = argument0
normal = argument1
uv = argument2

// Create lists
if (app.export_shape.shape_export_position_list = null)
{
	app.export_shape.shape_export_position_list = ds_list_create()
	app.export_shape.shape_export_uv_list = ds_list_create()
	app.export_shape.shape_export_vertex_list = ds_list_create()
	
	app.export_shape.shape_unique_position_list = ds_list_create()
	app.export_shape.shape_unique_uv_list = ds_list_create()
	
	if (debug_export_normals)
	{
		app.export_shape.shape_export_normal_list = ds_list_create()
		app.export_shape.shape_unique_normal_list = ds_list_create()
	}
}

var mat = matrix_create(point3D(0, 0, 0), point3D(0, 0, 90), vec3(1/8));

if (app.export_unparent_parts)
	mat = matrix_multiply(app.export_shape.matrix, mat)
else
	mat = matrix_multiply(matrix_multiply(app.export_shape.matrix, app.export_shape.parent.matrix_parent), mat)

pos = point3D_mul_matrix(pos, mat)

if (debug_export_normals)
{
	normal = point4D_mul_matrix(vec4(normal[X], normal[Y], normal[Z], 0), mat)
	normal = vec3(normal[X], normal[Y], normal[Z])
	normal = vec3_normalize(normal)
}

// Flip UV
uv[Y] = 1 - uv[Y]

ds_list_add(app.export_shape.shape_export_position_list, point3D(pos[X], pos[Z], pos[Y]))
ds_list_add(app.export_shape.shape_export_uv_list, uv)
ds_list_add(app.export_shape.shape_export_vertex_list, point3D(1, 1, 1))

if (debug_export_normals)
	ds_list_add(app.export_shape.shape_export_normal_list, point3D(normal[X], normal[Z], normal[Y]))
