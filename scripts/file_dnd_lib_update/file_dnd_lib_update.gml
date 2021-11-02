/// file_dnd_lib_update()
/// @desc Checks for file list updates

var prevlist;
prevlist = file_dnd_list

file_dnd_list = file_dnd_get_files()
file_dnd_reset_files()

if (file_dnd_list != "")
{
	var listarray = string_line_array(file_dnd_list)
	log(string(array_length_1d(listarray)) + " files dropped in window.")
	
	return listarray
}
else
	return null
