/// action_category_paste(category)
/// @arg category

function action_category_paste(cat)
{
	switch (cat.name)
	{
		case "position": action_el_pos_xyz(cat.copy); return 0;
		case "pivotoffset":  action_el_offset_xyz(cat.copy); return 0;
		case "rotation":  action_el_rot_xyz(cat.copy); return 0;
		case "size":  action_el_size_xyz(cat.copy); return 0;
		case "scale":  action_el_scale_xyz(cat.copy); return 0;
	}
}
