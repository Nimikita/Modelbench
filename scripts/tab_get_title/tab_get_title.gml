/// tab_get_title(tab)
/// @arg tab
/// @desc Returns the tab title.

var tab = argument0;

if (tab = assets)
	return text_get("tabassets")
else if (tab = preview)
	return text_get("tabpreview")
else if (tab = recent_models)
	return text_get("tabrecentmodels")
else if (tab = settings)
	return text_get("tabsettings")
else if (tab = element_editor)
{
	if (el_edit != null)
	{
		if (el_edit.name != "")
			return el_edit.name
		else
			return (el_edit.element_type = TYPE_PART ? text_get("assetsnewpart") : text_get("assetsnewshape"))
	}
	else
		return "???"
}

return ""
