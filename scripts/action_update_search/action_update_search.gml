/// action_update_search()
/// @desc Updates element search

ds_list_clear(app.assets.elements.element_search_list)

var text = string_upper(app.tab.elements.search_string);
ds_list_clear(app.tab.elements.element_search_list)
	
if (text != "")
{
	with (obj_model_element)
	{
		if (app.setting_hide_shapes && element_type = TYPE_SHAPE)
			continue
		
		var elementname = name = "" ? (element_type = TYPE_PART ? text_get("assetsnewpart") : text_get("assetsnewshape")) : name;
		
		if (string_contains(string_upper(elementname), text))
			ds_list_add(app.tab.elements.element_search_list, id)
	}
}
