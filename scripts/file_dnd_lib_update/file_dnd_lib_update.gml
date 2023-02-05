/// file_dnd_lib_update()
/// @desc Checks for file list updates

function file_dnd_lib_update()
{
	var prevlist;
	prevlist = file_dnd_list
	
	file_dnd_list = file_dnd_get_files()
	
	if (file_dnd_list != "")
	{
		var listarray = string_line_array(file_dnd_list)
		log(string(array_length(listarray)) + " files dropped in window.")
		
		file_dnd_set_enabled(false)
		file_dnd_set_enabled(true)
		
		return listarray
	}
	else
		return null
}
