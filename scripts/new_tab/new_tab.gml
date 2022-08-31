/// new_tab(location, show, [header])
/// @arg location
/// @arg show
/// @arg [header]
/// @desc Creates a new tab and sets its parameters.

function new_tab(location, show, header = null)
{
	var tab = new_obj(obj_tab);
	
	tab.panel = panel_map[?location]
	tab.panel_last = tab.panel
	tab.show = show
	tab.closeable = !tab.show
	tab.scroll = new_obj(obj_scrollbar)
	tab.movable = true
	tab.header_script = header
	
	if (tab.show)
		panel_tab_list_add(tab.panel, tab.panel.tab_list_amount, tab)
	
	return tab
}