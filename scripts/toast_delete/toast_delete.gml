/// toast_delete(label)
/// @arg label
/// @desc Removes toasts with a given label

function toast_delete(dellabel)
{
	with (obj_toast)
	{
		if (text = dellabel)
			remove = true
	}
}
