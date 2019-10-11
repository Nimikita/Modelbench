/// action_category_copy(category)
/// @arg category

var cat = argument0;

switch (cat.name)
{
	case "position": cat.copy = array(el_edit.value[e_value.POS_X], el_edit.value[e_value.POS_Y], el_edit.value[e_value.POS_Z]); return 0;
	case "pivotoffset": cat.copy = array(el_edit.value[e_value.OFFSET_X], el_edit.value[e_value.OFFSET_Y], el_edit.value[e_value.OFFSET_Z]); return 0;
	case "rotation": cat.copy = array(el_edit.value[e_value.ROT_X], el_edit.value[e_value.ROT_Y], el_edit.value[e_value.ROT_Z]); return 0;
	case "size": cat.copy = array(el_edit.value[e_value.WIDTH], el_edit.value[e_value.LENGTH], el_edit.value[e_value.HEIGHT]); return 0;
	case "scale": cat.copy = array(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Y], el_edit.value[e_value.SCA_Z]); return 0;
}
