/// tab_control_menu([size])
/// @arg [size]

function tab_control_menu()
{
	if (argument_count > 0)
		tab_control((label_height + 8) + argument[0])
	else
		tab_control(label_height + 32)
}
