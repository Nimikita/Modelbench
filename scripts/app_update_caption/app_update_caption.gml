/// app_update_caption()

function app_update_caption()
{
	if (!model_temporary && window_state = "")
		window_set_caption(filename_name(model_file) + " - Modelbench" + string_repeat("*", model_changed))
	else
		window_set_caption("Modelbench")
}
