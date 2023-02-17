/// app_startup_lists()

function app_startup_lists()
{
	globalvar el_type_name_list;
	globalvar language_english_map, language_map;
	globalvar scenery_list, special_thanks_list;
	
	// Element names
	el_type_name_list = ds_list_create()
	ds_list_add(el_type_name_list,
		"part",
		"block",
		"plane",
		"plane (3D)"
	)
	
	// Language
	language_english_map = ds_map_create()
	language_map = ds_map_create()
	
	language_load(language_file, language_english_map)
	ds_map_copy(language_map, language_english_map)
	
	// Background scenery
	scenery_list = ds_list_create()
	preview_scenery_load()
	
	// Special thanks
	special_thanks_list = ds_list_create()
	ds_list_add(special_thanks_list,
		"9redwoods",
		"Alpha Toostrr",
		"AnxiousCynic",
		"Cade [CaZaKoJa]",
		"Jnick",
		"Jossamations",
		"KeepOnChucking",
		"Rollo",
		"SKIBBZ",
		"UpgradedMoon",
		"Vash",
		"__Mine__"
	)
}
