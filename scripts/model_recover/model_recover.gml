/// model_recover()
/// @desc If available, loads the latest temporary model backup

if (file_exists_lib(temp_model_backup))
{
	log("Recovering latest available backup", temp_model_backup)
	
	model_load(temp_model_backup)
	model_temporary = true
}