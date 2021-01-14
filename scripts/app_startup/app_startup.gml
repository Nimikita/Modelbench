/// app_startup()

startup_last_crash = false
startup_error = true

model_load_startup()

if (!log_startup())
	return false

if (!lib_startup())
	return false

if (!file_lib_startup())
	return false

file_dnd_lib_startup()

if (!file_exists_lib(language_file))
	return missing_file(language_file)

vertex_format_startup()
if (!shader_startup())
	return false

export_startup()

app_startup_lists()
app_startup_window()
app_startup_themes()

json_startup()
settings_startup()
render_startup()
camera_startup()

app_startup_interface()
model_startup()

if (dev_mode)
	model_create()
else if (model_startup_fn != "")
	model_load(model_startup_fn)

startup_error = false

return true
