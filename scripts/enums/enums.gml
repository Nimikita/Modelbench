/// enums()
/// @desc Defines enumerators used in the project.

enum e_mouse
{
	LEFT_CLICK,
	MIDDLE_CLICK,
	RIGHT_CLICK,
	LEFT_DRAG,
	MIDDLE_DRAG,
	RIGHT_DRAG,
	SCROLL
}

// Menus
enum e_menu
{
	LIST
}

enum e_mode
{
	MODELING,
	PREVIEW
}


enum e_features
{
	MIMODEL,
	OBJ
}

enum chevrons
{
	DOWN,
	UP
}

enum e_snap_mode
{
	ABSOLUTE,
	LOCAL
}

// Scrollbar
enum e_scroll
{
	VERTICAL,
	HORIZONTAL
}

enum e_shortcut
{
	KEY,
	CONTROL,
	SHIFT
}

enum e_viewport_render
{
	FLAT,
	SHADED,
	TEXTURED
}

// Bend
enum e_bend
{
	FORWARD,
	BACKWARD,
	BOTH
}

// Vertex wave
enum e_vertex_wave
{
	NONE,
	Z_ONLY,
	ALL
}

enum e_settings
{
	FORMAT_ALPHA_2 = 0,
	FORMAT_101	   = 1,
	FORMAT_111	   = 2
}

enum e_snackbar
{
	DEFAULT,
	ERROR,
	WARNING,
	SUCCESS
}

enum e_element
{
	PART,
	BLOCK,
	PLANE,
	PLANE_3D,
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

enum e_tool
{
	SELECT,
	PIVOT,
	MOVE,
	ROTATE,
	SCALE,
	TRANSFORM,
	BEND,
	RESIZE,
	amount
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

enum e_control
{
	POS_X,
	POS_Y,
	POS_Z,
	POS_XY,
	POS_XZ,
	POS_YZ,
	POS_PAN,
	
	ROT_X,
	ROT_Y,
	ROT_Z,
	
	SCA_X,
	SCA_Y,
	SCA_Z,
	SCA_XYZ,
	
	PIVOT_X,
	PIVOT_Y,
	PIVOT_Z,
	PIVOT_XY,
	PIVOT_XZ,
	PIVOT_YZ,
	PIVOT_PAN,
	
	BEND_X,
	BEND_Y,
	BEND_Z,
	BEND_OFFSET,
	BEND_SIZE,
	
	RESIZE_XP,
	RESIZE_YP,
	RESIZE_ZP,
	RESIZE_XN,
	RESIZE_YN,
	RESIZE_ZN
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
	OVERLAYS,
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
	SHADED,
	BLOCKY_BENDING,
	WIND,
	FLAT,
	TEXTURED,
	WALK,
	RENAME,
	TOOLSET_RESIZE,
	LEFT_CLICK,
	LEFT_DRAG,
	MIDDLE_CLICK,
	MIDDLE_DRAG,
	RIGHT_CLICK,
	RIGHT_DRAG,
	SCROLL,
	
	PLACEHOLDER = 11
}
