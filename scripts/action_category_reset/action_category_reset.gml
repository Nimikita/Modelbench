/// action_category_paste(category)
/// @arg category

var cat = argument0;

switch (cat.name)
{
	case "position": action_el_pos_xyz(array(0, 0, 0)); return 0;
	case "pivotoffset":  action_el_offset_xyz(array(0, 0, 0)); return 0;
	case "rotation":  action_el_rot_xyz(array(0, 0, 0)); return 0;
	case "size":  action_el_size_xyz(array(16, 16, 16)); return 0;
	case "scale":  action_el_scale_xyz(array(1, 1, 1)); return 0;
}
