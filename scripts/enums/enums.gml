/// enums()
/// @desc Defines enumerators used in the project.

enum e_settings
{
	FORMAT_ALPHA_2 = 0,
	FORMAT_101	   = 1
}

enum e_element
{
	PART,
	BLOCK,
	PLANE,
	PLANE_3D,
	amount
}

enum e_snackbar
{
	DEFAULT,
	ERROR,
	WARNING,
	SUCCESS
}

enum e_mode
{
	MODELING,
	PREVIEW
}

enum e_tool
{
	SELECT,
	PIVOT,
	MOVE,
	ROTATE,
	SCALE,
	TRANSFORM,
	BEND,
	amount
}

enum e_features
{
	MIMODEL,
	OBJ
}

enum e_orientation
{
	GLOBAL,
	LOCAL,
	GIMBAL
}

// Icons
enum icons
{
	MENU,
	NEW_FILE,
	OPEN_FILE,
	INFO,
	CLOSE,
	POINT_LEFT,
	POINT_RIGHT,
	SAVE,
	SAVE_AS,
	IMPORT,
	SETTINGS,
	HELP,
	ARROW_DOWN,
	ARROW_RIGHT,
	ARROW_TOP,
	ARROW_LEFT,
	ARROW_DOWN_SMALL,
	ARROW_RIGHT_SMALL,
	ARROW_TOP_SMALL,
	ARROW_LEFT_SMALL,
	ASSETS,
	BLOCK,
	BLOCK_ADD,
	PLANE,
	PLANE_ADD,
	PLANE3D,
	PLANE3D_ADD,
	PART,
	EDIT,
	DELETE,
	COPY,
	PASTE,
	RESET,
	MAGNET,
	SHOW,
	HIDE,
	LINK,
	LOCK,
	UNLOCK, 
	UV_ROTATE_COUNTER,
	UV_ROTATE,
	UV_EDITOR,
	PART_ADD,
	PIN,
	IMPORT_PART,
	RECENT_GRID,
	RECENT_LIST,
	UNDO,
	REDO,
	ADD,
	REFRESH,
	CHECKMARK,
	TEXTURE_ADD,
	STAR,
	TEXTURE_ERROR,
	TEXTURE_UVMAP,
	DOWNLOAD,
	REMIND,
	DUPLICATE,
	PIVOT,
	SEARCH,
	PLAY,
	PAUSE,
	LOOP,
	OPTIONS,
	TOOLSET_POSITION,
	SCALE,
	TOOLSET_ROTATE,
	UV_MIRROR,
	UV_FLIP,
	UV_ROTATE_180,
	SORT_DOWN,
	SORT_UP,
	WARNING,
	CLOSE_SMALL,
	COLLAPSE,
	EYEDROPPER,
	BEND,
	DOT,
	TOOLSET_SCALE,
	CURSOR,
	RECENT_FILES,
	NEW_FILE_TEMPLATE,
	TRANSFORM,
	ALERT,
	CUT,
	REPLACE,
	COLLAPSE_ALL,
	EXPAND_ALL,
	DUSK,
	DAY,
	NIGHT,
	SQUARE_RATIO,
	DONATE,
	CUT_ALL,
	COPY_ALL,
	PASTE_ALL,
	RESET_ALL,
	DUPLICATE_SELECTION,
	DELETE_SELECTION,
	MODEL,
	TIP,
	SELECT_ALL,
	EXPORT_OBJ,
	GLOBAL,
	LOCAL,
	GIMBAL,
	
	PLACEHOLDER = 11
}

// Render modes
enum e_render_mode
{
	COLOR,
	COLOR_LIGHT,
	SKY,
	PREVIEW,
	HIGH_LIGHT_SUN_DEPTH,
	HIGH_LIGHT_SUN,
	HIGH_SSAO_DEPTH_NORMAL,
	SHAPE,
	SHAPE_OUTLINE,
	NORMALS,
	CLICK,
	SELECT,
	ALPHA_FIX,
	ALPHA_TEST
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
	MIX_AMOUNT,
	
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
	BEND_X_MIN,
	BEND_Y_MIN,
	BEND_Z_MIN,
	BEND_X_MAX,
	BEND_Y_MAX,
	BEND_Z_MAX,
	BEND_INVERT_X,
	BEND_INVERT_Y,
	BEND_INVERT_Z,
	BEND_ANGLE_X,
	BEND_ANGLE_Y,
	BEND_ANGLE_Z,
	INHERIT_BEND,
	
	// Shape properties
	BEND_SHAPE,
	TEX_MIRROR,
	INVERT,
	FACE_CAMERA,
	HOVER,
	EXTRUDE,
	HIDE_FRONT,
	HIDE_BACK,
	
	// Shape UV
	UV_X,
	UV_Y,
	FROM_X,
	FROM_Y,
	FROM_Z,
	TO_X,
	TO_Y,
	TO_Z,
	OFFSET_X,
	OFFSET_Y,
	OFFSET_Z,
	WIDTH,
	LENGTH,
	HEIGHT,
	INFLATE,
	
	// Wind
	WIND_AXIS,
	WIND_ZMIN_ENABLE,
	WIND_ZMIN,
	WIND_ZMAX_ENABLE,
	WIND_ZMAX,
	
	// Misc
	OPEN_POSITION_TAB,
	TEXTURE_OBJ,
	amount
}

// Menus
enum e_menu
{
	LIST
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
