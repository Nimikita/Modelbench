/// enums()
/// @desc Defines enumerators used in the project.

// Icons
enum e_icon
{
	menu,
	new_file,
	open_file,
	info,
	close,
	point_left,
	point_right,
	save,
	save_as,
	import,
	settings,
	help,
	arrow_down,
	arrow_right,
	arrow_top,
	arrow_left,
	arrow_down_small,
	arrow_right_small,
	arrow_top_small,
	arrow_left_small,
	assets,
	block,
	block_add,
	plane,
	plane_add,
	plane3d,
	plane3d_add,
	part,
	edit,
	delete,
	copy,
	paste,
	reset,
	snap,
	show,
	hide,
	link,
	lock,
	unlock, 
	uv_rotate_counter,
	uv_rotate,
	uveditor,
	part_add,
	pin,
	import_part,
	recent_grid,
	recent_list,
	undo,
	redo,
	add,
	refresh,
	checkmark,
	texture_add,
	star,
	texture_error,
	texture_uvmap,
	download,
	remind,
	duplicate,
	center,
	search,
	play,
	pause,
	loop,
	options,
	toolset_position,
	toolset_scale,
	toolset_rotate,
	uv_mirror,
	uv_flip,
	uv_rotate_180,
	sort_down,
	sort_up,
	warning,
	close_small,
	collapse,
	eyedropper,
	bend,
	dot
}

// Render modes
enum e_render_mode
{
	COLOR,
	SKY,
	PREVIEW,
	HIGH_LIGHT_SUN_DEPTH,
	HIGH_LIGHT_SUN,
	HIGH_SSAO_DEPTH_NORMAL,
	SHAPE,
	SHAPE_OUTLINE,
	NORMALS
}

// Values
enum e_value
{
	POS_X,
	POS_Y,
	POS_Z,
	ROT_X,
	ROT_Y,
	ROT_Z,
	SCA_X,
	SCA_Y,
	SCA_Z,
	
	// Color
	INHERIT_COLOR,
	OPACITY,
	BRIGHTNESS,
	BLEND_COLOR,
	MIX_COLOR,
	MIX_PERCENT,
	
	// Bend
	BEND,
	BEND_LOCK,
	BEND_OFFSET,
	BEND_SIZE_CUSTOM,
	BEND_SIZE,
	BEND_PART,
	BEND_AXIS_X,
	BEND_AXIS_Y,
	BEND_AXIS_Z,
	BEND_DIR_X,
	BEND_DIR_Y,
	BEND_DIR_Z,
	BEND_INVERT_X,
	BEND_INVERT_Y,
	BEND_INVERT_Z,
	BEND_ANGLE_X,
	BEND_ANGLE_Y,
	BEND_ANGLE_Z,
	
	// Shape properties
	TEX_MIRROR,
	INVERT,
	HIDE_BACKFACE,
	FACE_CAMERA,
	HOVER,
	PLANE_3D,
	
	// Shape UV
	UV_X,
	UV_Y,
	FROM_X,
	FROM_Y,
	FROM_Z,
	TO_X,
	TO_Y,
	TO_Z,
	INFLATE,
	
	// Wind
	WIND_WAVE,
	WIND_ZMIN_ENABLE,
	WIND_ZMIN,
	WIND_ZMAX_ENABLE,
	WIND_ZMAX,
	
	// Misc
	SHOW_POSITION_TAB,
	INHERIT_TEXTURE,
	TEXTURE_OBJ,
	amount
}

// Parts
enum e_part
{
	RIGHT,
	LEFT,
	FRONT,
	BACK,
	UPPER,
	LOWER,
	amount
}

// Bend
enum e_bend
{
	FORWARD,
	BACKWARD,
	BOTH
}

// Scrollbar
enum e_scroll
{
	VERTICAL,
	HORIZONTAL
}

// Vertex wave
enum e_vertex_wave
{
	NONE,
	Z_ONLY,
	ALL
}
