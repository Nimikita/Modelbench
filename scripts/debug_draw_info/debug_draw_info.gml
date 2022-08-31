/// debug_draw_info()

function debug_draw_info()
{
	if (!debug_info)
		return 0
	
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = window_height
	
	// Debug info
	var str = "";
	
	str += "Performance: \n"
	str += "======================================= \n"
	str += "FPS: " + string(fps) + " \n"
	str += "FPS real: " + string(fps_real) + " \n"
	str += "delta: " + string(delta) + " \n"
	str += "Step event: " + string(step_event_time) + "ms" + " \n"
	str += "Draw event: " + string(draw_event_time) + "ms" + " \n"
	str += "\n"
	
	str += "Window: \n"
	str += "======================================= \n"
	str += "DPI: " + string(display_get_dpi_x()) + "," + string(display_get_dpi_y()) + " \n"
	str += "Size: " + string(window_width) + "," + string(window_height) + " \n"
	str += "window_busy: " + window_busy + " \n"
	str += "window_focus: " + window_focus + " \n"
	str += "current_step: " + string(current_step) + " \n"
	str += "\n"
	
	str += "Model: \n"
	str += "======================================= \n"
	str += "model_file: " + model_file + " \n"
	str += "model_folder: " + model_folder + " \n"
	str += "working_directory: " + working_directory + " \n"
	str += "file_directory: " + file_directory + " \n"
	str += "\n"
	str += "Parts: " + string(model_parts) + " \n"
	str += "Shapes: " + string(model_shapes) + " \n"
	str += "    Planes: " + string(model_planes) + " \n"
	str += "    3D planes: " + string(model_planes3d) + " \n"
	str += "    Blocks: " + string(model_blocks) + " \n"
	
	var h = string_height_font(str, font_label) + 16;
	
	draw_box(8, window_height - h - 8, string_width_font(str, font_label) + 16, h, false, c_black, .75)
	draw_label(str, 16, window_height - 16, fa_left, fa_bottom, c_white, 1, font_label)
}
