/// tab_menu()

for (var i = 0; i < ds_list_size(menu_panel_list.item); i++)
	draw_list_item(menu_panel_list.item[|i], dx, dy + 36 * i, dw, 36, (menu_panel_ext != null) && (menu_panel_ext = menu_panel_list.item[|i].value))
