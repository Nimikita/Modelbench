/// draw_inputbox(name, x, y, width, placeholder, textbox, script[, capwid[, height[, padding[, font]]]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg placeholder
/// @arg textbox
/// @arg script
/// @arg [capwid]
/// @arg [height]
/// @arg [padding]
/// @arg [font]

var inputname, xx, yy, w, placeholder, tbx, script, capwid, h, padding, font;
var update;

inputname = argument[0]
xx = argument[1]
yy = argument[2]
w = argument[3]
placeholder = argument[4]
tbx = argument[5]
script = argument[6]

if (argument_count > 7) 
    capwid = argument[7]
else
    capwid = string_width(text_get(inputname))

if (argument_count > 8)
    h = argument[8]
else
    h = 28
    
if (argument_count > 9)
    padding = argument[9]
else
    padding = 3

if (argument_count > 10)
    font = argument[10]
else
    font = null

var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, w, h) && content_mouseon && (window_busy = "" || window_busy = string(tbx) + "click")
mouseclick = mouseon && mouse_left

microani_set(string(tbx) + inputname, script, mouseon || window_focus = string(tbx), false, (mouseon && mouse_left) || (window_focus = string(tbx)))

//if (mouseon)
//	mouse_cursor = cr_handpoint

//if (!mouseon && mouse_left && window_focus = string(tbx))
//	input_lastfocus = string(tbx)

// Defocus event
/*
if ((input_lastfocus != window_focus) && (input_lastfocus != null) && (input_lastfocus = string(tbx)))
{
	 Autofill fields if empty
	if ((inputname = "startuptitlemodelname") || (inputname = "textboxpartname") || (inputname = "textboxshapename"))
	{
		if (script != null)
		{
			script_execute(script, tbx.text, true)
			script = null
		}
	}
	
	input_lastfocus = null
}
*/

// Field background
var outlinecolor, outlinealpha, outlineoff;
outlinecolor = merge_color(c_neutral60, c_accent, mcroani_arr[e_mcroani.ACTIVE])
outlinealpha = lerp(a_neutral60, 1, mcroani_arr[e_mcroani.ACTIVE])
outlineoff = lerp(0, 1, max(mcroani_arr[e_mcroani.ACTIVE], mcroani_arr[e_mcroani.HOVER]))

draw_outline(xx + outlineoff + 2, yy + outlineoff + 2, w - 4 - outlineoff*2, h - 4 - outlineoff*2, 2 + outlineoff, outlinecolor, outlinealpha)

// Textbox
draw_set_font(font_value)

update = textbox_draw(tbx, xx + 10, yy + 6, w - 20, h - 9)

if (tbx.text = "" && placeholder != "")
    draw_label(string_limit(placeholder, w - padding * 2), xx + padding + 7, yy + h - 6, fa_left, fa_bottom, c_neutral40, a_neutral40, font_value)

if (update && (script != null))
    script_execute(script, tbx.text)

// Input boxes don't use a holding animation, but need a warning animation
microani_update(mouseon || window_focus = string(tbx), false, window_focus = string(tbx))

return update