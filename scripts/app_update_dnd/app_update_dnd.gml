/// app_update_dnd()

if (file_dnd_delay = 0)
{
	file_dnd_active = (window_state = "")

	file_dnd_set_files("*.*", file_dnd_active, true)

	file_dnd_array = file_dnd_lib_update();

	if (file_dnd_array = null)
		return 0
	else
	{
		file_dnd_delay++
		return 0
	}
}

if (file_dnd_delay < 5)
{
	file_dnd_delay++
	return 0
}

var ext, modelfile;
modelfile = ""

for (var i = 0; i < array_length_1d(file_dnd_array); i++)
{
	ext = filename_ext(file_dnd_array[i])
	
	for (var j = 0; j <= 9; j++)
		ext = string_replace(ext, string(j), "")
	
	if (ext = ".mimodel" || ext = ".mbtemplate" || ext = ".mbbackup")
	{
		modelfile = file_dnd_array[i]
		break;
	}
}

var texhover = null;
for (var i = 0; i < ds_list_size(textures_list.item); i++)
{
	if (textures_list.item[|i].hover)
	{
		texhover = textures_list.item[|i]
		break;
	}
}

// Any model file found should be loaded by itself
if (modelfile = "")
{
	for (var i = 0; i < array_length_1d(file_dnd_array); i++)
	{
		ext = filename_ext(file_dnd_array[i])
		
		// Image file
		if (ext = ".png" || ext = ".jpeg")
		{
			// Replace main texture with dropped texture
			if (texhover != null && app.res != null)
			{
				action_texture_replace(texhover.value, file_dnd_array[i])
				break;
			}
			else
				action_texture_add(file_dnd_array[i])
		}
	}
}
else
{
	// Model, template, or backup file
	model_load(modelfile)
}

file_dnd_delay = 0
file_dnd_array = null
