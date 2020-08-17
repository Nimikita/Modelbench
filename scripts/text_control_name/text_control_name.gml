/// text_control_name(shortcut)
/// @arg shortcut

var shortcut, text;
shortcut = argument0
text = ""

// Shortcut requires ctrl button
if (shortcut[e_shortcut.CONTROL])
	text = text_get("keycontrol") + " + "

// Shortcut requires shift
if (shortcut[e_shortcut.SHIFT])
{
	if (shortcut[e_shortcut.KEY] = "" || shortcut[e_shortcut.KEY] = vk_shift)
		return text + text_get("keyshift")
	else
		text = text + text_get("keyshift") + " + "
}

switch (shortcut[e_shortcut.KEY])
{
	case vk_left:			return text + text_get("keyleft")
	case vk_right:			return text + text_get("keyright")
	case vk_up:				return text + text_get("keyup")
	case vk_down:			return text + text_get("keydown")
	case vk_enter:			return text + text_get("keyenter")
	case vk_escape:			return text + text_get("keyescape")
	case vk_space:			return text + text_get("keyspace")
	case vk_lshift:			return text + text_get("keyleftshift")
	case vk_rshift:			return text + text_get("keyrightshift")
	case vk_lalt:			return text + text_get("keyleftalt")
	case vk_ralt:			return text + text_get("keyrightalt")
	case vk_lcontrol:		return text + text_get("keyleftcontrol")
	case vk_rcontrol:		return text + text_get("keyrightcontrol")
	case vk_backspace:		return text + text_get("keybackspace")
	case vk_tab:			return text + text_get("keytab")
	case vk_home:			return text + text_get("keyhome")
	case vk_end:			return text + text_get("keyend")
	case vk_delete:			return text + text_get("keydelete")
	case vk_insert:			return text + text_get("keyinsert")
	case vk_pageup:			return text + text_get("keypageup")
	case vk_pagedown:		return text + text_get("keypagedown")
	case vk_pause:			return text + text_get("keypause")
	case vk_printscreen:	return text + text_get("keyprintscreen")
	case vk_f1:				return text + "F1"
	case vk_f2:				return text + "F2"
	case vk_f3:				return text + "F3"
	case vk_f4:				return text + "F4"
	case vk_f5:				return text + "F5"
	case vk_f6:				return text + "F6"
	case vk_f7:				return text + "F7"
	case vk_f8:				return text + "F8"
	case vk_f9:				return text + "F9"
	case vk_f10:			return text + "F10"
	case vk_f11:			return text + "F11"
	case vk_f12:			return text + "F12"
}

if (shortcut[e_shortcut.KEY] = "")
	return text
else
	return text + chr(shortcut[e_shortcut.KEY])
