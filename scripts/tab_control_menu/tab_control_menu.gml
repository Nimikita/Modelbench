/// tab_control_menu([size])
/// @arg size

function tab_control_menu()
{
	if (argument_count > 0)
		tab_control(20 + argument[0])
	else
		tab_control(48)
}
