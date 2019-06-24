/// draw_textfield(name, x, y, width, value, textbox, script, [placeholder, [labelpos]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg value
/// @arg textbox
/// @arg script
/// @arg [placeholder
/// @arg [labelpos]]

var name, xx, yy, wid, value, textbox, script, placeholder, labelpos;
var update, capwidth;
name = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
value = argument[4]
textbox = argument[5]
script = argument[6]
placeholder = ""
labelpos = "top"

capwidth = 0

if (argument_count > 7)
	placeholder = argument[7]
	
if (argument_count > 8)
	labelpos = argument[8]

if (labelpos = "top")
	yy += 48 - 28
else
	capwidth = string_width_font(text_get(name), font_emphasis) + 10

update = draw_inputbox(name, xx + capwidth, yy, wid - capwidth, placeholder, textbox, script)

// Use microanimation from inputbox to determine color
var labelcolor, labelalpha;
labelcolor = merge_color(c_neutral50, c_accent, mcroani_arr[e_mcroani.ACTIVE])
labelalpha = lerp(a_neutral50, 1, mcroani_arr[e_mcroani.ACTIVE])

draw_box_hover(xx + capwidth, yy, wid - capwidth, 28, max(mcroani_arr[e_mcroani.HOVER], mcroani_arr[e_mcroani.ACTIVE]))

if (labelpos = "top")
	draw_label(text_get(name), xx, yy - 8, fa_left, fa_bottom, labelcolor, labelalpha, font_label)
else
	draw_label(text_get(name), xx, yy + 21, fa_left, fa_bottom, labelcolor, labelalpha, font_emphasis)

return update
//textbox_draw(textbox, xx, yy + 48 - 28, wid, 28)