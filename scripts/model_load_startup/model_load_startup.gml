/// model_load_startup()
/// @desc Checks system parameters to see if Modelbench was launched with a model file. Load file if a file is found.

model_startup_fn = ""

for (var i = 0; i < parameter_count(); i++)
{
	var p, ext;
	p = parameter_string(i)
	ext = filename_ext(p)
	
	for (var j = 0; j <= 9; j++)
		ext = string_replace(ext, string(j), "")
	
	if (ext = ".mimodel" || ext = ".mbtemplate" || ext = ".mbbackup")
	{
		model_startup_fn = p
		return 0
	}
}
