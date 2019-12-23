/// lib_startup()

log("External library init")

var pathfile, pathwindow;
pathfile = "Data\\file.dll"
pathwindow = "Data\\window.dll"

if (!file_exists(pathfile))
	return missing_file(pathfile)
	
if (!file_exists(pathwindow))
	return missing_file(pathwindow)

globalvar lib_open_url, lib_json_file_convert_unicode;
globalvar lib_window_maximize, lib_window_set_focus;

// File library
log("External library", pathfile)
lib_open_url = external_define(pathfile, "open_url", dll_cdecl, ty_real, 1, ty_string)
lib_json_file_convert_unicode = external_define(pathfile, "json_file_convert_unicode", dll_cdecl, ty_real, 2, ty_string, ty_string)

// Window library
log("External library", pathwindow)
lib_window_maximize = external_define(pathwindow, "window_maximize", dll_cdecl, ty_real, 1, ty_string)
lib_window_set_focus = external_define(pathwindow, "window_set_focus", dll_cdecl, ty_real, 1, ty_string)

// Check for crashes
if (startup_last_crash)
{
	if (show_question("Do you want to report the crash now via the Mine-imator forums? In your bug report, provide instructions on how to recreate the bug and upload the log contents. If the issue concerns a specific model, upload its contents as a .zip.")) 
	{
		//open_url(link_forums_bugs)
		open_url(log_previous_file)
	}
}

return true
