/// draw_texture_item(x, y, width, height, texture)
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg texture

var xx, yy, wid, hei, tex;
var mouseon;
xx = argument0
yy = argument1
wid = argument2
hei = argument3
tex = argument4

if (!instance_exists(tex))
	return 0

mouseon = app_mouse_box(xx, yy, wid, hei) && content_mouseon

microani_set(string(tex) + "item", null, mouseon, false, tex = res_edit)
microani_update(mouseon, false, tex = res_edit)
draw_box_hover(xx, yy, wid, hei, mcroani_arr[e_mcroani.HOVER])

draw_box(xx, yy, wid, hei, false, c_overlay, a_overlay * mcroani_arr[e_mcroani.HOVER])

if (mouseon)
{
	mouse_cursor = cr_handpoint
	
	if (mouse_left_pressed)
	{
		if (res_edit = tex)
			res_edit = null
		else
			res_edit = tex
	}
}

draw_box(xx, yy, wid, hei, false, c_accent_overlay, a_accent_overlay * mcroani_arr[e_mcroani.ACTIVE])

// Draw texture preview
draw_box(xx + 8, yy + 8, 32, 32, false, c_border, a_border)

var xsca, ysca, scale;
xsca = 32 / sprite_get_width(tex.sprite)
ysca = 32 / sprite_get_height(tex.sprite)
scale = min(xsca, ysca)
draw_image(tex.sprite, 0, xx + 8, yy + 8, scale, scale)

// Texture name
draw_label(tex.filename, xx + 44 + 8, yy + 8 + 16, fa_left, fa_bottom, c_text_main, a_text_main, font_value)

// Texture size
draw_label(text_get("assetstexturesize", tex.size[X], tex.size[Y]), xx + 44 + 8, yy + 8 + 30, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_caption)

// Main texture?
if (tex = app.res)
	draw_tooltip_icon("roottexture", xx + wid - 28, yy + hei/2, icons.STAR, text_get("assetsroottexture"))
