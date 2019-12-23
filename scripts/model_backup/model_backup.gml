/// model_backup()

var fn = model_folder + "\\" + filename_change_ext(filename_name(model_file), "");

log("Backup", fn)

for (var b = setting_backup_amount - 1; b > 0; b--)
	if (file_exists_lib(fn + ".mbbackup" + string(b)))
		file_rename_lib(fn + ".mbbackup" + string(b), fn + ".mbbackup" + string(b + 1))

model_temporary_backup = model_temporary

model_save(fn + ".mbbackup1")
model_reset_backup()

model_temporary_backup = false

log("Backup saved")
