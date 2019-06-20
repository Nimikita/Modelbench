/// draw_button_collapse(name, value, script, disabled)
/// @arg name
/// @arg value
/// @arg script
/// @arg disabled

draw_button_icon(argument0 + "collapse", dx - icon_button_offset, dy + (tab_control_h / 2) - 12, 24, 24, argument1, e_icon.collapse, argument2, argument3, test(argument1, "tooltiphideoptions", "tooltipshowoptions"))

dx += 28 + 8
dw -= 28 + 8
tab_collapse = true
