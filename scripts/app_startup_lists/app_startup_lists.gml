/// app_startup_lists()

globalvar el_type_name_list;
globalvar language_english_map, language_map;
globalvar accent_list, beta_testers_list;

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

// Accent colors
accent_list = ds_list_create()
ds_list_add(accent_list, 
	hex_to_color("EC0020"), // Red
	hex_to_color("FF5722"), // Orange
	hex_to_color("F49A0D"), // Yellow/Gold
	hex_to_color("2FB32C"), // Lime
	hex_to_color("43A047"), // Green
	hex_to_color("12A88D"), // Green blue
	hex_to_color("00ACC1"), // Light blue
	hex_to_color("2144F1"), // Royal blue
	hex_to_color("E539C7"), // Purple
	hex_to_color("F21865")  // Pink
)

// Beta testers
beta_testers_list = ds_list_create()
ds_list_add(beta_testers_list,
	"AnxiousCynic",
	"Aronan",
	"BloxTheRigger",
	"Emunator",
	"Espresso",
	"Ezcha",
	"Hozq",
	"KeepOnChucking",
	"Marvin",
	"Mike",
	"Mr.Banders",
	"Rollo",
	"Royn",
	"SKIBBZ",
	"TheTanJames",
	"UpgradedMoon",
	"Vash"
)