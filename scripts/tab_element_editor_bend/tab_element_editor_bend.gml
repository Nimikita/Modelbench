/// tab_element_editor_bend()

// Bend axes
var axis, axislen, axisname;
axislen = 0
for (var i = X; i <= Z; i++)
	axislen += (el_edit.bend_axis[i])

if (!setting_z_is_up)
	axis = array(X, Z, Y)
else
	axis = array(X, Y, Z)
axisname = array("x", "y", "z")

for (var i = X; i <= Z; i++)
{
	axis_edit = axis[i]
	
	tab_control_switch()
	draw_button_collapse("elementeditorbendaxis" + axisname[i], !setting_collapse_bend_axis[axis_edit], action_collapse_bend_axis, !el_edit.value[e_value.BEND_AXIS_X + axis_edit])
	draw_switch("elementeditorbendaxis" + axisname[i], dx, dy, el_edit.value[e_value.BEND_AXIS_X + axis_edit], action_el_bend_axis, false)
	tab_next()
	
	if (setting_collapse_bend_axis[axis_edit] || !el_edit.value[e_value.BEND_AXIS_X + axis_edit])
		continue
	
	// Invert
	tab_control_switch()
	draw_switch("elementeditorbendinvert" + axisname[i], dx, dy, el_edit.value[e_value.BEND_INVERT_X + axis_edit], action_el_bend_invert, false)
	tab_next()
	
	// Range
	tab_control_meter()
	draw_meter_range("elementeditorbendrange" + axisname[i], dx, dy, dw, -180, 180, 1, el_edit.value[e_value.BEND_X_MIN + axis_edit], el_edit.value[e_value.BEND_X_MAX + axis_edit], -180, 180, element_editor.bend.tbx_min[axis_edit], element_editor.bend.tbx_max[axis_edit], action_el_bend_min, action_el_bend_max)
	tab_next()
	
	// Angle
	tab_control_meter()
	draw_meter("elementeditorbendangle" + axisname[i], dx, dy, dw, el_edit.value[e_value.BEND_ANGLE_X + axis_edit], 48, el_edit.value[e_value.BEND_X_MIN + axis_edit], el_edit.value[e_value.BEND_X_MAX + axis_edit], 0, 1, element_editor.bend.tbx_angle[axis_edit], action_el_bend_angle)
	tab_next()
}

// Inherit bend angles
tab_control_switch()
draw_switch("elementeditorbendinheritangles", dx, dy, el_edit.value[e_value.INHERIT_BEND], action_el_inherit_bend, false, "elementeditorbendinheritangleshelp", !el_edit.value[e_value.BEND])
tab_next()

// Bend part
var text;

switch (el_edit.value[e_value.BEND_PART])
{
	case e_part.RIGHT: text = "elementeditorbendpartright"; break;
	case e_part.LEFT: text = "elementeditorbendpartleft"; break;
	case e_part.FRONT: text = "elementeditorbendpartfront"; break;
	case e_part.BACK: text = "elementeditorbendpartback"; break;
	case e_part.UPPER: text = "elementeditorbendpartupper"; break;
	case e_part.LOWER: text = "elementeditorbendpartlower"; break;
}

// Bend part
tab_control_menu()
draw_button_menu("elementeditorbendpart", e_menu.LIST, dx, dy, dw, 28, el_edit.value[e_value.BEND_PART], text_get(text), action_el_bend_part, !el_edit.value[e_value.BEND])
tab_next()

// Bend offset
tab_control(28)
draw_textfield_num("elementeditorbendoffset", dx, dy, 86, el_edit.value[e_value.BEND_OFFSET], 0.1, -no_limit, no_limit, 0, snap_value, element_editor.bend.tbx_offset, action_el_bend_offset, !el_edit.value[e_value.BEND])
tab_next()

// Bend size
tab_control_switch()
draw_switch("elementeditorbendcustomsize", dx, dy, el_edit.value[e_value.BEND_SIZE_CUSTOM], action_el_bend_size_custom, false, "elementeditorbendcustomsizehelp", !el_edit.value[e_value.BEND])
tab_next()

if (el_edit.value[e_value.BEND_SIZE_CUSTOM])
{
	tab_control(28)
	draw_textfield_num("elementeditorbendsize", dx, dy, 86, el_edit.value[e_value.BEND_SIZE], 0.1, 0.0001, no_limit, 4, snap_value, element_editor.bend.tbx_size, action_el_bend_size, !el_edit.value[e_value.BEND])
	tab_next()
}