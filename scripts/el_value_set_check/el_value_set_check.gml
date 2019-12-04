/// el_value_set_check(element, vid)
/// @arg element
/// @arg vid
/// @desc Checks values of an object, history data, and value editing to determine if the value should be edited.

var element, vid;
element = argument0
vid = argument1

// Planes shouldn't auto-center on Y axis when editing in UV editor
if (element.element_type = TYPE_SHAPE && element.type = "plane" && history_data.par_script = action_el_uv_size && vid = e_value.OFFSET_Y)
	return false

return true