/// action_group_copy()

function action_group_copy_range(group, vid1, vid2)
{
	var a = [];
	
	var i = 0;
	for (var j = vid1; j <= vid2; j++)
	{
		a[i] = el_edit.value[j]
		i++
	}
			
	context_group_copy_list[|group] = a
}

function action_group_copy()
{
	var group = context_menu_group;
	
	switch (group)
	{
		case e_context_group.POSITION:
		{
			context_group_copy_list[|group] = array(el_edit.value[e_value.POS_X], el_edit.value[e_value.POS_Y], el_edit.value[e_value.POS_Z])
			return;
		}
		
		case e_context_group.PIVOT_OFFSET:
		{
			context_group_copy_list[|group] = array(el_edit.value[e_value.OFFSET_X], el_edit.value[e_value.OFFSET_Y], el_edit.value[e_value.OFFSET_Z])
			return;
		}
		
		case e_context_group.ROTATION:
		{
			context_group_copy_list[|group] = array(el_edit.value[e_value.ROT_X], el_edit.value[e_value.ROT_Y], el_edit.value[e_value.ROT_Z])
			return;
		}
		
		case e_context_group.SIZE:
		{
			context_group_copy_list[|group] = array(el_edit.value[e_value.WIDTH], el_edit.value[e_value.HEIGHT], el_edit.value[e_value.LENGTH])
			return;
		}
		
		case e_context_group.SCALE:
		{
			context_group_copy_list[|group] = array(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Y], el_edit.value[e_value.SCA_Z])
			return;
		}
		
		case e_context_group.BEND:
		{
			action_group_copy_range(group, e_value.BEND_OFFSET, e_value.INHERIT_BEND)
			return;
		}
		
		case e_context_group.MATERIAL:
		{
			action_group_copy_range(group, e_value.TEXTURE_OBJ, e_value.BRIGHTNESS)
			return;
		}
		
		case e_context_group.APPEARANCE:
		{
			action_group_copy_range(group, e_value.INFLATE, e_value.HIDE_BACK)
			return;
		}
		
		case e_context_group.WIND:
		{
			action_group_copy_range(group, e_value.WIND_AXIS, e_value.WIND_ZMAX)
			return;
		}
		
		case e_context_group.MINEIMATOR:
		{
			context_group_copy_list[|group] = array(el_edit.value[e_value.OPEN_POSITION_TAB], el_edit.value[e_value.DEPTH])
			return;
		}
	}
}
