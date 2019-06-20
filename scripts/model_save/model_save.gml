/// model_save([filename])
/// @arg [filename]

var fn;
if (argument_count > 0)
	fn = argument[0]
else
	fn = model_file
	
log("Saving project", fn)

save_folder = model_folder
load_folder = model_folder
log("save_folder", save_folder)
log("load_folder", load_folder)

debug_timer_start()

model_save_start(fn)
model_save_children()
model_save_done()

debug_timer_stop("model_save")
log("Model saved")

if (!string_contains(filename_ext(fn), "backup"))
{
	model_changed = false
	recent_add_wait = true
}
