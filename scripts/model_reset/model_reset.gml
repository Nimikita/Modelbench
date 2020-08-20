/// model_reset()

log("Resetting model")

model_reset_backup()
history_clear()

res_edit = null
el_edit = null
el_edit_amount = 0
ds_list_clear(el_edit_list)

textures_list.update = true
tex_preview.update = true
tex_preview.reset_view = true

model_file = ""
model_folder = ""
model_changed = false
model_temporary = false
model_temporary_backup = false

model_name = ""
assets.model_properties.tbx_model_name.text = ""
res = null

player_skin = false
root_scale = 1

camera_reset()

popup = null
with (obj_popup)
{
	offset_x = 0
	offset_y = 0
}
popup_ani_type = "hide"

log("Destroying instances")

with (obj_model_element)
	instance_destroy()

with (obj_texture)
	instance_destroy()

if (part_list != null)
	ds_list_empty(part_list)
else
	part_list = ds_list_create()

app_update_el_edit()

for (var v = 0; v < e_value.amount; v++)
	value[v] = element_value_default(v)

// Clear snackbars from startup
with (obj_snackbar)
{
	// Recover model
	if (snackbar_action1_name = "startuprecovermodel")
		snackbar_close(id)
	
	// Tip
	if (tip != null)
		snackbar_close(id)
}

// Close menu
//menu_panel_ani_type = "hide"
//menu_open = false

log("Model resetted")
