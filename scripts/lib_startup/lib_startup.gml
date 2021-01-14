/// lib_startup()

log("External library init")

var pathfile, pathwindow, pathfilednd;
pathfile = "Data\\file.dll"
pathwindow = "Data\\window.dll"
pathfilednd = "Data\\filedropper.dll"

if (!file_exists(pathfile))
	return missing_file(pathfile)
	
if (!file_exists(pathwindow))
	return missing_file(pathwindow)

if (!file_exists(pathfilednd))
	return missing_file(pathfilednd)

globalvar lib_file_rename, lib_file_copy, lib_file_delete, lib_file_exists, lib_open_url, lib_json_file_convert_unicode;
globalvar file_copy_temp, lib_directory_create, lib_directory_exists, lib_directory_delete;
globalvar lib_window_maximize, lib_window_set_focus;
globalvar lib_file_dnd_get_enabled, lib_file_dnd_set_enabled, lib_file_dnd_get_files, lib_file_dnd_set_files, lib_file_dnd_get_handle,
		  lib_file_dnd_set_handle, lib_file_dnd_reset_files;

// File library
log("External library", pathfile)
file_copy_temp = true
lib_file_rename = external_define(pathfile, "file_rename", dll_cdecl, ty_real, 2, ty_string, ty_string)
lib_file_copy = external_define(pathfile, "file_copy", dll_cdecl, ty_real, 2, ty_string, ty_string)
lib_file_delete = external_define(pathfile, "file_delete", dll_cdecl, ty_real, 1, ty_string)
lib_file_exists = external_define(pathfile, "file_exists", dll_cdecl, ty_real, 1, ty_string)
lib_directory_create = external_define(pathfile, "directory_create", dll_cdecl, ty_real, 1, ty_string)
lib_directory_delete = external_define(pathfile, "directory_delete", dll_cdecl, ty_real, 1, ty_string)
lib_directory_exists = external_define(pathfile, "directory_exists", dll_cdecl, ty_real, 1, ty_string)
lib_open_url = external_define(pathfile, "open_url", dll_cdecl, ty_real, 1, ty_string)
lib_json_file_convert_unicode = external_define(pathfile, "json_file_convert_unicode", dll_cdecl, ty_real, 2, ty_string, ty_string)

// Window library
log("External library", pathwindow)
lib_window_maximize = external_define(pathwindow, "window_maximize", dll_cdecl, ty_real, 1, ty_string)
lib_window_set_focus = external_define(pathwindow, "window_set_focus", dll_cdecl, ty_real, 1, ty_string)

// File dropper library (https://marketplace.yoyogames.com/assets/8207/file-dropper)
log("External library", pathfilednd)
lib_file_dnd_get_enabled = external_define(pathfilednd, "file_dnd_get_enabled", dll_cdecl, ty_real, 0)
lib_file_dnd_set_enabled = external_define(pathfilednd, "file_dnd_set_enabled", dll_cdecl, ty_real, 1, ty_real)
lib_file_dnd_get_files = external_define(pathfilednd, "file_dnd_get_files", dll_cdecl, ty_string, 0)
lib_file_dnd_set_files = external_define(pathfilednd, "file_dnd_set_files", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real)
lib_file_dnd_get_handle = external_define(pathfilednd, "file_dnd_get_hwnd", dll_cdecl, ty_string, 0)
lib_file_dnd_set_handle = external_define(pathfilednd, "file_dnd_set_hwnd", dll_cdecl, ty_real, 1, ty_string)
lib_file_dnd_reset_files = external_define(pathfilednd, "file_dnd_reset_files", dll_cdecl, ty_real, 0)

// Check for crashes
if (startup_last_crash && !dev_mode && model_startup_fn = "")
{
	if (show_question("Do you want to report the crash now via the Mine-imator forums? In your bug report, provide instructions on how to recreate the bug and upload the log contents. If the issue concerns a specific model, upload its contents as a .zip.")) 
	{
		//open_url(link_forums_bugs)
		open_url(log_previous_file)
	}
}

return true
