/// action_player_skin(value)
/// @arg value

if (history_undo)
{
	with (history_data) 
		other.player_skin = save_var_old_value[0]
}
else if (history_redo)
{
	with (history_data) 
		other.player_skin = save_var_new_value[0]
}
else
{
	var hobj = history_save_var_start(action_player_skin, true);
	
	with (hobj)
		history_save_var(other.id, other.player_skin, argument0)
	
	player_skin = argument0
}

