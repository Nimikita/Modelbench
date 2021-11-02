/// text_control_name(shortcut, [array])
/// @arg shortcut
/// @arg [array]

var shortcut, isarray, text, arr;
shortcut = argument[0]
text = ""
arr = []

if (argument_count > 1)
	isarray = argument[1]
else
	isarray = false

// Shortcut requires ctrl button
if (shortcut[e_shortcut.CONTROL])
{
	if (isarray)
		arr = array_add(arr, text_get("keycontrol"))
	else
		text = text_get("keycontrol") + " + "
}

// Shortcut requires shift
if (shortcut[e_shortcut.SHIFT])
{
	if (shortcut[e_shortcut.KEY] = "" || shortcut[e_shortcut.KEY] = vk_shift)
	{
		if (isarray)
			arr = array(text_get("keyshift"))
		else
			key = text_get("keyshift")
	}
	else
	{
		if (isarray)
			arr = array_add(arr, text_get("keyshift"))
		else
			text = text + text_get("keyshift") + " + "
	}
}

var key = null;

switch (shortcut[e_shortcut.KEY])
{
	case vk_left:			key = text_get("keyleft"); break;
	case vk_right:			key = text_get("keyright"); break;
	case vk_up:				key = text_get("keyup"); break;
	case vk_down:			key = text_get("keydown"); break;
	case vk_enter:			key = text_get("keyenter"); break;
	case vk_escape:			key = text_get("keyescape"); break;
	case vk_space:			key = text_get("keyspace"); break;
	case vk_lshift:			key = text_get("keyleftshift"); break;
	case vk_rshift:			key = text_get("keyrightshift"); break;
	case vk_alt:			key = text_get("keyalt"); break;
	case vk_lalt:			key = text_get("keyleftalt"); break;
	case vk_ralt:			key = text_get("keyrightalt"); break;
	case vk_lcontrol:		key = text_get("keyleftcontrol"); break;
	case vk_rcontrol:		key = text_get("keyrightcontrol"); break;
	case vk_backspace:		key = text_get("keybackspace"); break;
	case vk_tab:			key = text_get("keytab"); break;
	case vk_home:			key = text_get("keyhome"); break;
	case vk_end:			key = text_get("keyend"); break;
	case vk_delete:			key = text_get("keydelete"); break;
	case vk_insert:			key = text_get("keyinsert"); break;
	case vk_pageup:			key = text_get("keypageup"); break;
	case vk_pagedown:		key = text_get("keypagedown"); break;
	case vk_pause:			key = text_get("keypause"); break;
	case vk_printscreen:	key = text_get("keyprintscreen"); break;
	case vk_f1:				key = "F1"; break;
	case vk_f2:				key = "F2"; break;
	case vk_f3:				key = "F3"; break;
	case vk_f4:				key = "F4"; break;
	case vk_f5:				key = "F5"; break;
	case vk_f6:				key = "F6"; break;
	case vk_f7:				key = "F7"; break;
	case vk_f8:				key = "F8"; break;
	case vk_f9:				key = "F9"; break;
	case vk_f10:			key = "F10"; break;
	case vk_f11:			key = "F11"; break;
	case vk_f12:			key = "F12"; break;
}

if (key != null)
{
	if (isarray)
		return array_add(arr, key)
	else
		return text + key
}

if (key = null)
{
	if (shortcut[e_shortcut.KEY] = "")
	{
		if (isarray)
			return arr
		else
			return text
	}
	else
	{
		if (isarray)
			return array_add(arr, chr(shortcut[e_shortcut.KEY]))
		else
			return text + chr(shortcut[e_shortcut.KEY])
	}
}