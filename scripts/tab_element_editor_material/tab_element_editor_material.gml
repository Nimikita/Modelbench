/// tab_element_editor_material()

// Texture
var value, text, texture;

if (el_edit.value[e_value.TEXTURE_OBJ] != null)
{
	value = el_edit.value[e_value.TEXTURE_OBJ]
	text = value.filename
	texture = value.sprite
}
else
{
	value = null
	text = text_get("elementeditorinherittexture")
	texture = null
}

tab_control_menu(28)
draw_button_menu("elementeditortexture", e_menu.LIST, dx, dy, dw, 28, value, text, action_el_texture, false, texture)
tab_next()

// Inherit color
tab_control_switch()
draw_switch("elementeditorinheritcolor", dx, dy, el_edit.value[e_value.INHERIT_COLOR], action_el_inherit_color, true, "elementeditorinheritcolorhelp")
tab_next()

// Blend color
tab_control_color()
draw_button_color("elementeditorblendcolor", dx, dy, el_edit.value[e_value.BLEND_COLOR], c_white, action_el_blend_color)
tab_next()

// Mix color
tab_control_color()
draw_button_color("elementeditormixcolor", dx, dy, el_edit.value[e_value.MIX_COLOR], c_black, action_el_mix_color)
tab_next()

// Mix amount
tab_control_meter()
draw_meter("elementeditormixamount", dx, dy, dw, round(el_edit.value[e_value.MIX_AMOUNT] * 100), 48, 0, 100, 0, 1, tab.material.tbx_mix_amount, action_el_mix_amount)
tab_next()

// Opacity
tab_control_meter()
draw_meter("elementeditoropacity", dx, dy, dw, round(el_edit.value[e_value.OPACITY] * 100), 48, 0, 100, 100, 1, tab.material.tbx_opacity, action_el_opacity)
tab_next()

// Brightness
tab_control_meter()
draw_meter("elementeditorbrightness", dx, dy, dw, round(el_edit.value[e_value.BRIGHTNESS] * 100), 48, 0, 100, 0, 1, tab.material.tbx_brightness, action_el_brightness)
tab_next()
