/// app_startup()

startup_last_crash = false
startup_error = true

if (!log_startup())
	return false

if (!lib_startup())
	return false

if (!file_exists(language_file))
	return missing_file(language_file)

vertex_format_startup()
if (!shader_startup())
	return false

app_startup_lists()
app_startup_window()
app_startup_themes()

//alert_startup()
json_startup()
settings_startup()
render_startup()
camera_startup()

app_startup_interface()
model_startup()

startup_error = false

return true
