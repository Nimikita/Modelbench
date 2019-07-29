/// history_restore_element()

var el;

for (var i = 0; i < history_data.spawn_amount; i++)
{
	el = new_element(history_data.spawn_save_type[i])
	el.save_id = history_data.spawn_save_id[i]
}
