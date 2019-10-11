/// draw_keycontrol(name, x, y, width, key, ctrl, keydefault, ctrldefault, script)
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg key
/// @arg ctrl
/// @arg keydefault
/// @arg ctrldefault
/// @arg script 

var name, xx, yy, wid, key, ctrl, keydef, ctrldef, script;
var hei, text, mouseon;
name = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
key = argument[4]
ctrl = argument[5]
keydef = argument[6]
ctrldef = argument[7]
script = argument[8]

hei = 28
text = text_get(name) + ":"
mouseon = app_mouse_box(content_x, yy, content_width, hei) && content_mouseon

context_menu_area(content_x, yy, content_width, hei, "contextmenukeycontrol", array(keydef, ctrldef), e_value_type.NONE, script, null)

// Check key
if (window_busy = name)
{
	if (ctrl != null)
		ctrl = keyboard_check(vk_control)
	
	if (mouse_left_pressed || keyboard_check_pressed(vk_escape))
	{
		window_busy = ""
		app_mouse_clear()
	}
	else if (keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_control))
	{
		// GM bug shift workaround
		var key = keyboard_lastkey;
		
		if (key = 16) // Left shift
			key = vk_lshift
		
		if (key = 13) // Right shift
			key = vk_rshift
		
		keyboard_clear(keyboard_lastkey)
		
		if (ctrl != null)
			script_execute(script, key, ctrl)
		else
			script_execute(script, key)
		
		window_busy = ""
	}
}

microani_set(name, script, mouseon || window_busy = name, mouseon && mouse_left, false)
microani_update(mouseon || window_busy = name, mouseon && mouse_left, false)

var hover = mcroani_arr[e_mcroani.HOVER];

// Edit button
var editx, edity;
edity = yy + 2
editx = xx + dw - 24 + icon_button_offset

draw_set_alpha(hover)
if (draw_button_icon(name + "editbutton", editx, edity, 24, 24, window_busy = name, e_icon.edit, null, false, "tooltipeditshortcut"))
	window_busy = name
draw_set_alpha(1)

// Label
draw_label(text, xx, yy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)

if (window_busy = name)
	key = ""

// Value
draw_label(text_control_name(key, ctrl), xx + wid - ((24 + 8) * hover), yy + 14, fa_right, fa_middle, c_text_main, a_text_main, font_value)
