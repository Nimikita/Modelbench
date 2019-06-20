/// tab_assets_elements()

tab_control_switch()
draw_switch("assetshideshapes", dx, dy, setting_hide_shapes, action_setting_hide_shapes)
tab_next()

// Draw elements
if (part_list != null)
{
	for (var i = 0; i < ds_list_size(part_list); i++)
		draw_element_item(part_list[|i], dy, 0)
}
dy += 8

