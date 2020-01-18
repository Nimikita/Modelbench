/// action_texture_save_uv_map()

var fn, tex, surf;
var front, back, left, right, top, bottom;
fn = file_dialog_save_image("")

if (fn = "")
	return 0

log("Export UV map", fn)

tex = context_menu_value
surf = surface_create(tex.size[X], tex.size[Y])

// Accent colors
front = theme_light.accent_list[6]
back = theme_light.accent_list[0]
left = theme_light.accent_list[8]
right = theme_light.accent_list[3]
top = theme_light.accent_list[2]
bottom = theme_light.accent_list[7]

render_set_culling(false)

surface_set_target(surf)
{
	with (obj_model_element)
	{
		if (element_type != TYPE_SHAPE)
			continue
		
		// Front
		draw_box(value[e_value.UV_X], value[e_value.UV_Y], value[e_value.WIDTH], value[e_value.HEIGHT], false, front, 1)
		draw_outline(value[e_value.UV_X], value[e_value.UV_Y], value[e_value.WIDTH], value[e_value.HEIGHT], 1, merge_color(front, c_black, .1), 1, true)
		
		if (type = "plane")
			continue
		
		// Back
		draw_box(value[e_value.UV_X] + value[e_value.WIDTH] + value[e_value.LENGTH], value[e_value.UV_Y], value[e_value.WIDTH], value[e_value.HEIGHT], false, back, 1)
		draw_outline(value[e_value.UV_X] + value[e_value.WIDTH] + value[e_value.LENGTH], value[e_value.UV_Y], value[e_value.WIDTH], value[e_value.HEIGHT], 1, merge_color(back, c_black, .1), 1, true)
		
		// Left
		draw_box(value[e_value.UV_X] + value[e_value.WIDTH], value[e_value.UV_Y], value[e_value.LENGTH], value[e_value.HEIGHT], false, left, 1)
		draw_outline(value[e_value.UV_X] + value[e_value.WIDTH], value[e_value.UV_Y], value[e_value.LENGTH], value[e_value.HEIGHT], 1, merge_color(left, c_black, .1), 1, true)
		
		// Right
		draw_box(value[e_value.UV_X] - value[e_value.LENGTH], value[e_value.UV_Y], value[e_value.LENGTH], value[e_value.HEIGHT], false, right, 1)
		draw_outline(value[e_value.UV_X] - value[e_value.LENGTH], value[e_value.UV_Y], value[e_value.LENGTH], value[e_value.HEIGHT], 1, merge_color(right, c_black, .1), 1, true)
		
		// Top
		draw_box(value[e_value.UV_X], value[e_value.UV_Y] - value[e_value.LENGTH], value[e_value.WIDTH], value[e_value.LENGTH], false, top, 1)
		draw_outline(value[e_value.UV_X], value[e_value.UV_Y] - value[e_value.LENGTH], value[e_value.WIDTH], value[e_value.LENGTH], 1, merge_color(top, c_black, .1), 1, true)
		
		// Bottom
		draw_box(value[e_value.UV_X] + value[e_value.WIDTH], value[e_value.UV_Y] - value[e_value.LENGTH], value[e_value.WIDTH], value[e_value.LENGTH], false, bottom, 1)
		draw_outline(value[e_value.UV_X] + value[e_value.WIDTH], value[e_value.UV_Y] - value[e_value.LENGTH], value[e_value.WIDTH], value[e_value.LENGTH], 1, merge_color(bottom, c_black, .1), 1, true)
	}
}
surface_reset_target()

render_set_culling(true)

surface_save(surf, fn)
surface_free(surf)

snackbar_save_image(fn)
