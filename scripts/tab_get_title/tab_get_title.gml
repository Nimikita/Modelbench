/// tab_get_title(tab)
/// @arg tab
/// @desc Returns the tab title.

var tab = argument0;

switch (tab)
{
	case assets: return text_get("tabassets")
	case preview: return text_get("tabpreview")
	case recent_models: return text_get("tabrecentmodels")
	case export: return text_get("tabexportmodel")
	case settings: return text_get("tabsettings")
	case element_editor:
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
	default: return ""
}

