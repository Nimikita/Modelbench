/// export_startup()
/// @desc .obj exporting

export_model = false
export_shape = null

export_verticies = 0
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
