/// listitem_event_destroy()

function listitem_event_destroy()
{
	if (actions_left != null)
		ds_list_destroy(actions_left)
	
	if (actions_right != null)
		ds_list_destroy(actions_right)
}
