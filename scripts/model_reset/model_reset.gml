/// model_reset()

log("Resetting model")

model_reset_backup()
history_clear()

res_edit = null
el_edit = null
el_edit_amount = 0

tex_preview.update = true

model_file = ""
model_folder = ""
model_changed = false
model_temporary = false
model_temporary_backup = false

model_name = ""
res = null

player_skin = false
root_scale = vec3(1)

camera_work_reset()

log("Destroying instances")

with (obj_model_element)
	instance_destroy()

with (obj_texture)
	instance_destroy()

if (part_list != null)
{
	ds_list_destroy(part_list)
	part_list = null
}
app_update_el_edit()

for (var v = 0; v < e_value.amount; v++)
	value_default[v] = element_value_default(v)

log("Model resetted")
