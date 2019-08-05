/// new_snackbar(icon, text, [description, [variant]])
/// @arg icon
/// @arg text
/// @arg [description
/// @arg [variant]]

var sb = new(obj_snackbar);
sb.icon = argument[0]
sb.label = argument[1]

if (argument_count > 2)
	sb.description = argument[2]

if (argument_count > 3)
	sb.variant = argument[3]

sb.snackbar_y = window_height

ds_list_insert(snackbar_list, 0, sb)

return sb