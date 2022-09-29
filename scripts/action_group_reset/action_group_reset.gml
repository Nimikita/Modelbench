/// action_group_reset()

function action_group_reset()
{
	var group, vid, size;
	group = context_menu_group
	
	switch (group)
	{
		case e_context_group.POSITION: vid = e_value.POS_X; size = 3; break;
		case e_context_group.ROTATION: vid = e_value.ROT_X; size = 3; break;
		case e_context_group.SIZE: vid = e_value.WIDTH; size = 3; break;
		case e_context_group.SCALE: vid = e_value.SCA_X; size = 3; break;
		case e_context_group.BEND: vid = e_value.BEND_OFFSET; size = 20; break;
		case e_context_group.MATERIAL: vid = e_value.TEXTURE_OBJ; size = 7; break;
		case e_context_group.APPEARANCE: vid = e_value.INFLATE; size = 9; break;
		case e_context_group.WIND: vid = e_value.WIND_AXIS;  size = 5; break;
		case e_context_group.MINEIMATOR: vid = e_value.OPEN_POSITION_TAB; size = 2; break;
	}
	
	el_value_set_start(action_group_reset, false)
	
	for (var i = 0; i < size; i++)
		el_value_set(vid + i, element_value_default(vid + i), false)
	
	el_value_set_done()
}