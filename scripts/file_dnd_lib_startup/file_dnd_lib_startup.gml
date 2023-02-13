/// file_dnd_lib_startup()

function file_dnd_lib_startup()
{
	file_dnd_set_handle(window_handle())
	file_dnd_set_enabled(true)
	
	file_dnd_list = ""
	file_dnd_active = false
	file_dnd_delay = 0
	file_dnd_array = null
}
