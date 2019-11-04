/// tab_menu()

for (var i = 0; i < ds_list_size(menu_panel_list.item); i++)
{
	draw_list_item(menu_panel_list.item[|i], dx, dy, dw, 36, (menu_panel_ext != null) && (menu_panel_ext = menu_panel_list.item[|i].value))
	dy += 36
	
	// Kinda hacky, but it's a unique scenerio where padding is needed for a divider
	if (i + 1 < ds_list_size(menu_panel_list.item))
	{
		if (menu_panel_list.item[|i + 1].script = action_open_settings)
		{
			dy += 8
			draw_divide(dx, dy, dw)
			dy += 8
		}
	}
}
