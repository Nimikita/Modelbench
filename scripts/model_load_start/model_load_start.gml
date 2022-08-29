/// model_load_start(filename)
/// @arg filename
/// @desc Checks if model JSON can be parsed

function model_load_start(fn)
{
	// Decode JSON
	var map = json_load(fn);
	if (!ds_map_valid(map))
	{
		log("Could not parse JSON file", fn)
		error("errorfileunreadable")
		return null
	}
	
	return map
}
