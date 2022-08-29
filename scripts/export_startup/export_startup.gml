/// export_startup()
/// @desc .obj exporting

function export_startup()
{
	export_shape = null
	
	export_verticies = 0
	export_quads = 0
	export_triangles = 0
	
	export_material = ""
	
	export_fn = ""
	export_mtl_fn = ""
	
	export_position_list = ds_list_create()
	export_normal_list = ds_list_create()
	export_uv_list = ds_list_create()
	
	enum e_export {
		COMBINE_ALL,
		SEPERATE_PARTS,
		SEPERATE_SHAPES
	}
	
	export_mode = e_export.COMBINE_ALL
	export_selection_only = false
	export_include_hidden = false
	export_unparent_parts = false
	export_combine_locked = true
	
	export_shapes = ds_list_create()
	
	export_elements = ds_list_create()
	
	// generate, compile, face
	export_stage = ""
	
	export_file = null
	
	export_generation_done = 0
	export_generation_max = 0
	
	export_compile_done = 0
	export_compile_max = 0
	
	export_face_done = 0
	export_face_max = 0
}
