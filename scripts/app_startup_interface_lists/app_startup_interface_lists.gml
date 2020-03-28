/// app_startup_interface_lists()

globalvar list_edit, listitem_last;
list_edit = null
listitem_last = null

menu_panel_list = new_list()
list_edit = menu_panel_list
list_add_item("menunewmodel", null, "", null, icons.NEW_FILE, null, model_create)
list_add_item("menunewmodeltemplate", null, "", null, icons.NEW_FILE_TEMPLATE, null, model_create_template)
list_add_item("menuopenmodel", null, "", null, icons.OPEN_FILE, null, model_load)
list_add_item("menurecentmodels", recent_models, "", null, icons.RECENT_FILES, icons.ARROW_RIGHT_SMALL, action_open_recent_models) // Open recent models
list_add_item("menusave", null, "", null, icons.SAVE, null, model_save)
list_add_item("menusaveas", null, "", null, icons.SAVE_AS, null, model_save_as)
list_add_item("menuimportmodel", null, "", null, icons.IMPORT, null, action_model_import)
list_add_item("menuexportmodel", null, "", null, icons.EXPORT_OBJ, icons.ARROW_RIGHT_SMALL, action_open_export)

list_add_item("menusettings", settings, "", null, icons.SETTINGS, icons.ARROW_RIGHT_SMALL, action_open_settings, false) // Open settings
list_add_item("menuabout", null, "", null, icons.INFO, icons.ARROW_RIGHT_SMALL, action_open_about) // Open about
menu_panel_list.get_name = true

textures_list = new_list()

globalvar listitem_value;
listitem_value = null
