/// tab_menu()

var bh = 36;

// Top
draw_panel_buttton("menunewmodel", dx, dy, dw, bh, false, e_icon.new_file, false, model_create)
dy += bh

draw_panel_buttton("menunewmodeltemplate", dx, dy, dw, bh, false, e_icon.new_file_template, false, model_create_template)
dy += bh

draw_panel_buttton("menuopenmodel", dx, dy, dw, bh, false, e_icon.open_file, false, model_load)
dy += bh

if (draw_panel_buttton("menurecentmodels", dx, dy, dw, bh, menu_panel_ext = recent_models, e_icon.recent_files, true))
{
	menu_panel_ext = recent_models
	menu_panel_ext_ani_type = "show"
}
dy += bh

draw_panel_buttton("menusave", dx, dy, dw, bh, false, e_icon.save, false, model_save)
dy += bh

draw_panel_buttton("menusaveas", dx, dy, dw, bh, false, e_icon.save_as, false, model_save_as, model_temporary)
dy += bh

draw_panel_buttton("menuimportmodel", dx, dy, dw, bh, false, e_icon.import, false, null, true)
dy += bh

draw_divide(dx, dy, dw)

if (draw_panel_buttton("menusettings", dx, dy, dw, bh, menu_panel_ext = settings, e_icon.settings, true))
{
	menu_panel_ext = settings
	menu_panel_ext_ani_type = "show"
}
dy += bh

if (draw_panel_buttton("menuabout", dx, dy, dw, bh, menu_panel_ext = about, e_icon.info, true))
{
	menu_panel_ext = about
	menu_panel_ext_ani_type = "show"
}
dy += bh

