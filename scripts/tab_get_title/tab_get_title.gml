/// tab_get_title(tab)
/// @arg tab
/// @desc Returns the tab title.

var tab = argument0;

if (tab = assets)
	return text_get("tabassets")
else if (tab = element_editor)
{
	if (el_edit = null)
		return "???"
	else
		return el_edit.name
}
else if (tab = open_model)
	return text_get("tabopenmodel")
else if (tab = settings)
	return text_get("tabsettings")
else if (tab = about)
	return text_get("tababout")

return ""
