/// draw_textfield(name, x, y, width, height, textbox, script, [placeholder, [labelpos, [error]]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg textbox
/// @arg script
/// @arg [placeholder
/// @arg [labelpos
/// @arg [error]]]

function draw_textfield()
{
	var name, xx, yy, w, h, textbox, script, placeholder, labelpos, err, fieldy;
	var update, capwidth;
	name = argument[0]
	xx = argument[1]
	yy = argument[2]
	w = argument[3]
	h = argument[4]
	textbox = argument[5]
	script = argument[6]
	placeholder = ""
	labelpos = "top"
	err = false
	
	capwidth = 0
	fieldy = yy
	
	if (argument_count > 7)
		placeholder = argument[7]
	
	if (argument_count > 8)
		labelpos = argument[8]
	
	if (argument_count > 9)
		err = argument[9]
	
	draw_set_font(font_label)
	
	if (labelpos = "top")
		fieldy += (label_height + 8)
	else if (labelpos = "none")
		capwidth = 0
	else
		capwidth = string_width(text_get(name)) + 8
	
	if (xx + w < content_x || xx > content_x + content_width || yy + h < content_y || yy > content_y + content_height)
		return 0
	
	update = draw_inputbox(name, xx + capwidth, fieldy, w - capwidth, h, placeholder, textbox, script, false, err)
	
	// Use microanimation from inputbox to determine color
	draw_set_font(font_label)
	
	var labelcolor, labelalpha;
	labelcolor = merge_color(c_text_secondary, c_text_main, microani_arr[e_microani.HOVER])
	labelcolor = merge_color(labelcolor, c_accent, microani_arr[e_microani.ACTIVE])
	labelalpha = lerp(a_text_secondary, a_text_main, microani_arr[e_microani.HOVER])
	labelalpha = lerp(labelalpha, a_accent, microani_arr[e_microani.ACTIVE])
	
	if (err)
	{
		labelcolor = c_error
		labelalpha = 1
	}
	
	if (labelpos = "top")
		draw_label(string_limit(text_get(name), dw), xx, yy - 3, fa_left, fa_top, labelcolor, labelalpha)
	else if (labelpos != "none")
		draw_label(text_get(name), xx, yy + h/2, fa_left, fa_middle, labelcolor, labelalpha)
	
	return update
}
