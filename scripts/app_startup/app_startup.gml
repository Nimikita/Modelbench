/// app_startup()

startup_last_crash = false
startup_error = true

if (!log_startup())
	return false

if (!lib_startup())
	return false

if (!file_lib_startup())
	return false

if (!file_exists_lib(language_file))
	return missing_file(language_file)

vertex_format_startup()
if (!shader_startup())
	return false

app_startup_lists()
app_startup_window()

//alert_startup()
json_startup()
settings_startup()
model_startup()
render_startup()
camera_startup()

app_startup_interface()

startup_error = false

return true
