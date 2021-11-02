/// action_update_search()
/// @desc Updates element search

ds_list_clear(app.assets.elements.element_search_list)

var text = string_upper(app.assets.elements.search_string);
ds_list_clear(app.assets.elements.element_search_list)

if (text != "")
	action_update_search_part(text)
