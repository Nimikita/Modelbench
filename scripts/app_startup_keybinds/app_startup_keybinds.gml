/// app_startup_keybinds()

function app_startup_keybinds()
{
	globalvar keybinds, keybind_edit;
	keybinds = array_create(e_keybind.amount)
	keybind_edit = null
	
	enum e_keybind_key
	{
		CHAR,
		CTRL,
		SHIFT,
		ALT
	}
	
	enum e_keybind
	{
		// File
		MODEL_NEW,
		MODEL_NEW_TEMPLATE,
		MODEL_OPEN,
		MODEL_SAVE,
		MODEL_SAVE_AS,
		MODEL_IMPORT,
		
		// Editing
		UNDO,
		REDO,
		RENAME,
		ELEMENT_DELETE,
		ELEMENT_DUPLICATE,
		SELECT_ALL,
		UV_EDITOR,
		
		// Tools
		TOOL_SELECT,
		TOOL_MOVE,
		TOOL_PIVOT,
		TOOL_ROTATE,
		TOOL_RESIZE,
		TOOL_SCALE,
		TOOL_BEND,
		TOOL_TRANSFORM,
		SNAP,
		
		// Navigation
		CAM_WALK,
		CAM_FORWARD,
		CAM_BACK,
		CAM_LEFT,
		CAM_RIGHT,
		CAM_ASCEND,
		CAM_DESCEND,
		CAM_RESET,
		CAM_FAST,
		CAM_SLOW,
		
		amount
	}
	
	// File
	keybind_register("modelnew", e_keybind.MODEL_NEW, keybind_new("N", true))
	keybind_register("modelnewtemplate", e_keybind.MODEL_NEW_TEMPLATE, keybind_new("N", true, true))
	keybind_register("modelopen", e_keybind.MODEL_OPEN, keybind_new("O", true))
	keybind_register("modelsave", e_keybind.MODEL_SAVE, keybind_new("S", true))
	keybind_register("modelsaveas", e_keybind.MODEL_SAVE_AS, keybind_new("S", true, true))
	keybind_register("modelimport", e_keybind.MODEL_IMPORT, keybind_new("I", true))
	
	// Editing
	keybind_register("undo", e_keybind.UNDO, keybind_new("Z", true))
	keybind_register("redo", e_keybind.REDO, keybind_new("Y", true))
	keybind_register("rename", e_keybind.RENAME, keybind_new(vk_f2))
	keybind_register("delete", e_keybind.ELEMENT_DELETE, keybind_new(vk_delete))
	keybind_register("duplicate", e_keybind.ELEMENT_DUPLICATE, keybind_new("D", true))
	keybind_register("select", e_keybind.SELECT_ALL, keybind_new("A", true))
	keybind_register("uveditor", e_keybind.UV_EDITOR, keybind_new("E", true))
	
	// Tools
	keybind_register("toolselect", e_keybind.TOOL_SELECT, keybind_new("W"))
	keybind_register("toolmove", e_keybind.TOOL_MOVE, keybind_new("G"))
	keybind_register("toolpivot", e_keybind.TOOL_PIVOT, keybind_new("Q"))
	keybind_register("toolrotate", e_keybind.TOOL_ROTATE, keybind_new("R"))
	keybind_register("toolresize", e_keybind.TOOL_RESIZE, keybind_new("Z"))
	keybind_register("toolscale", e_keybind.TOOL_SCALE, keybind_new("S"))
	keybind_register("toolbend", e_keybind.TOOL_BEND, keybind_new("B"))
	keybind_register("tooltransform", e_keybind.TOOL_TRANSFORM, keybind_new("T"))
	keybind_register("snap", e_keybind.SNAP, keybind_new("F"))
	
	// Navigation
	keybind_register("camwalk", e_keybind.CAM_WALK, keybind_new("F", true))
	keybind_register("camforward", e_keybind.CAM_FORWARD, keybind_new("W"), true, false)
	keybind_register("camleft", e_keybind.CAM_LEFT, keybind_new("A"), true, false)
	keybind_register("camback", e_keybind.CAM_BACK, keybind_new("S"), true, false)
	keybind_register("camright", e_keybind.CAM_RIGHT, keybind_new("D"), true, false)
	keybind_register("camascend", e_keybind.CAM_ASCEND, keybind_new("E"), true, false)
	keybind_register("camdescend", e_keybind.CAM_DESCEND, keybind_new("Q"), true, false)
	keybind_register("camreset", e_keybind.CAM_RESET, keybind_new("R"), true, false)
	keybind_register("camfast", e_keybind.CAM_FAST, keybind_new(vk_space), true, false)
	keybind_register("camslow", e_keybind.CAM_SLOW, keybind_new(null, false, true), true, false)
	
	keybinds_update_match()
}
