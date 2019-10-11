/// action_keycontrol()

// Ctrl
if (context_menu_value[1] = null)
	script_execute(context_menu_value_script, context_menu_value[0])
else
	script_execute(context_menu_value_script, context_menu_value[0], context_menu_value[1])
