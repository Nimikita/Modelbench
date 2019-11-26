/// action_toolbar_undo()

if (history_pos = history_amount)
	return 0

history_data = history[history_pos]
el_edit = save_id_find(history_data.save_el_edit)
res_edit = save_id_find(history_data.save_res_edit)
axis_edit = history_data.save_axis_edit
save_id_seed = history_data.save_save_id_seed

log("Undo", script_get_name(history_data.script))

history_undo = true
script_execute(history_data.script)
history_undo = false

history_pos++
