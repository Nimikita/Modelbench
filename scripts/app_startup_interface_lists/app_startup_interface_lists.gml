/// app_startup_interface_lists()

globalvar list_edit, listitem_last;
list_edit = null
listitem_last = null

menu_panel_list = new_list()
list_edit = menu_panel_list
list_add_item(text_get("menunewmodel"), null, "", null, e_icon.new_file, null, model_create)
list_add_item(text_get("menunewmodeltemplate"), null, "", null, e_icon.new_file_template, null, model_create_template)
list_add_item(text_get("menuopenmodel"), null, "", null, e_icon.open_file, null, model_load)
list_add_item(text_get("menurecentmodels"), recent_models, "", null, e_icon.recent_files, e_icon.arrow_right_small, action_open_recent_models) // Open recent models
list_add_item(text_get("menusave"), null, "", null, e_icon.save, null, model_save)
list_add_item(text_get("menusaveas"), null, "", null, e_icon.save_as, null, model_save_as)
list_add_item(text_get("menuimportmodel"), null, "", null, e_icon.import, null, null)

list_add_item(text_get("menusettings"), settings, "", null, e_icon.settings, e_icon.arrow_right_small, action_open_settings, false) // Open settings
list_add_item(text_get("menuabout"), about, "", null, e_icon.info, e_icon.arrow_right_small, action_open_about) // Open about

textures_list = new_list()

globalvar listitem_value;
listitem_value = null
