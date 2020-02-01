/// new_snackbar(icon, text, [description, [variant, [seconds]]])
/// @arg icon
/// @arg text
/// @arg [description
/// @arg [variant
/// @arg [seconds]]]

var sb = new(obj_snackbar);
sb.icon = argument[0]
sb.name = argument[1]
sb.label = argument[1]
sb.tip = null

if (argument_count > 2)
	sb.description = argument[2]

if (argument_count > 3)
	sb.variant = argument[3]

if (argument_count > 4)
	sb.dismiss_time = argument[4]

sb.snackbar_y = window_get_height()

ds_list_insert(snackbar_list, 0, sb)

return sb