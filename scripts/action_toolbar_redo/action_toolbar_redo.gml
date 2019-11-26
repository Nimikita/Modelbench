/// action_toolbar_redo()

if (history_pos = 0)
	return 0

history_pos--

history_data = history[history_pos]
el_edit = save_id_find(history_data.save_el_edit)
res_edit = save_id_find(history_data.save_res_edit)
axis_edit = history_data.save_axis_edit
save_id_seed = history_data.save_save_id_seed

log("Redo", script_get_name(history_data.script))

history_redo = true
script_execute(history_data.script)
history_redo = false
