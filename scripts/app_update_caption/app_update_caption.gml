/// app_update_caption()

if (model_name != "" && !model_temporary)
	window_set_caption(filename_name(model_file) + " - Modelbench" + string_repeat("*", model_changed))
else
	window_set_caption("Modelbench")
