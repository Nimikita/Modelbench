/// action_search(search)
/// @arg search

if (history_undo)
{
	with (history_data)
	{
		app.assets.elements.search_string = save_var_old_value[0]
		app.assets.elements.tbx_search.text = app.assets.elements.search_string
	}
}
else if (history_redo)
{
	with (history_data)
	{
		app.assets.elements.search_string = save_var_new_value[0]
		app.assets.elements.tbx_search.text = app.assets.elements.search_string
	}
}
else
{
	var hobj = history_save_var_start(action_search, true);
	
	with (hobj)
		history_save_var(app, app.assets.elements.search_string, argument0)
	
	app.assets.elements.search_string = argument0
}

action_update_search()
