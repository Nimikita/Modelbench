/// action_group_paste()

function action_group_paste()
{
	var group, copy, vid;
	group = context_menu_group;
	copy = context_group_copy_list[|group]
	
	switch (group)
	{
		case e_context_group.POSITION: vid = e_value.POS_X; break;
		case e_context_group.ROTATION: vid = e_value.ROT_X; break;
		case e_context_group.SIZE: vid = e_value.WIDTH; break;
		case e_context_group.SCALE: vid = e_value.SCA_X; break;
		case e_context_group.BEND: vid = e_value.BEND_OFFSET; break;
		case e_context_group.MATERIAL: vid = e_value.TEXTURE_OBJ; break;
		case e_context_group.APPEARANCE: vid = e_value.INFLATE; break;
		case e_context_group.WIND: vid = e_value.WIND_AXIS; break;
		case e_context_group.MINEIMATOR: vid = e_value.OPEN_POSITION_TAB; break;
	}
	
	el_value_set_start(action_group_paste, false)
	
	for (var i = 0; i < array_length(copy); i++)
		el_value_set(vid + i, copy[i], false)
	
	el_value_set_done()
}