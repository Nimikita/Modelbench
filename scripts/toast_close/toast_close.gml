/// toast_close(toast)
/// @arg alert

function toast_close(toast)
{
	ds_list_delete_value(toast_list, toast.id)
	toast_amount--
	
	with (toast)
		instance_destroy()
}
