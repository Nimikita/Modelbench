/// tip_draw()

if (tip_show)
	tip_alpha = min(1, tip_alpha + 0.1 * delta)
else
	tip_alpha = max(0, tip_alpha - 0.1 * delta)

//if (mouse_wheel <> 0 || mouse_left)
//	tip_alpha = 0

if (tip_alpha = 0)
{
	tip_box_x = null
	tip_box_y = null
	return 0
}

// Box
draw_set_alpha(tip_alpha)
draw_box(tip_x, tip_y, tip_w, tip_h, false, c_neutral60, a_neutral60)

// Arrow
render_set_culling(false)
draw_image(spr_tooltip_arrow, 0,  tip_arrow_x, tip_arrow_y, 1, tip_arrow_yscale, c_neutral60, a_neutral60)
render_set_culling(true)

// Text
var texty = tip_y + tip_h - 4;
for (var i = 0; i < array_length_1d(tip_text_array); i++)
{
	var text = tip_text_array[i];
	draw_label(text, tip_x + (tip_w / 2), texty - 1, fa_center, fa_bottom, c_background, 1, font_caption)
	texty -= (8 + 7)
}

draw_set_alpha(1)

tip_show = false
