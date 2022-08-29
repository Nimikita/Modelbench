/// snackbar_delete(label)
/// @arg label
/// @desc Removes snackbars with a given label

function snackbar_delete(dellabel)
{
	with (obj_snackbar)
	{
		if (label = dellabel)
			remove = true
	}
}
