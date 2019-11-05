/// model_reset()

log("Resetting model")

model_reset_backup()
history_clear()

res_edit = null
el_edit = null
el_edit_amount = 0

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

camera_work_reset()

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
{
	value_default[v] = element_value_default(v)
	value_inherit[v] = value_default[v]
	value[v] = value_default[v]
}

// Clear 'recover model' snackbar
with (obj_snackbar)
{
	if (snackbar_action1_name = "startuprecovermodel")
	{
		snackbar_close(id)
		break
	}
}

// Close menu
//menu_panel_ani_type = "hide"
//menu_open = false

log("Model resetted")
