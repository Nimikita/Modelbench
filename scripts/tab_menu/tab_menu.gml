/// tab_menu()

// Top
draw_panel_buttton("menunewmodel", dx, dy, dw, 48, false, e_icon.new_file, false, model_create)
dy += 48

draw_panel_buttton("menunewmodeltemplate", dx, dy, dw, 48, false, e_icon.import, false, null, true)
dy += 48

if (draw_panel_buttton("menuopenmodel", dx, dy, dw, 48, menu_panel_ext = open_model, e_icon.open_file, true))
{
	menu_panel_ext = open_model
	menu_panel_ext_ani_type = "show"
}
dy += 48

draw_panel_buttton("menuimportmodel", dx, dy, dw, 48, false, e_icon.import, false, null, true)
dy += 48

draw_panel_buttton("menusave", dx, dy, dw, 48, false, e_icon.save, false, model_save)
dy += 48

draw_panel_buttton("menusaveas", dx, dy, dw, 48, false, e_icon.save_as, false, model_save_as, model_temporary)
dy = content_y + content_height - 8 - 48

// Bottom
if (draw_panel_buttton("menuabout", dx, dy, dw, 48, menu_panel_ext = about, e_icon.info, true))
{
	menu_panel_ext = about
	menu_panel_ext_ani_type = "show"
}
dy -= 48

if (draw_panel_buttton("menusettings", dx, dy, dw, 48, menu_panel_ext = settings, e_icon.settings, true))
{
	menu_panel_ext = settings
	menu_panel_ext_ani_type = "show"
}