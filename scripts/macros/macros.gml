/// macros()
/// @desc Defines constants used in the project.

// Debug
#macro dev_mode						true

// Versions
#macro modelbench_version			"1.0.0"
#macro modelbench_version_full		modelbench_version + "-a1"
#macro modelbench_version_extra		""
#macro modelbench_version_date		"2019.06.24"
#macro gm_runtime					GM_runtime_version

// File formats
#macro settings_format				e_settings.FORMAT_100

// Directories
#macro file_directory				game_save_id
#macro data_directory				working_directory + "Data\\"
#macro models_directory				working_directory + "Models\\"
#macro fonts_directory				data_directory + "Fonts\\"
#macro languages_directory			data_directory + "Languages\\"

// Files
#macro language_file				languages_directory + "english.mblanguage"
#macro settings_file				data_directory + "settings.mbdata"
#macro recent_file					data_directory + "recent.mbdata"
#macro key_file						data_directory + "key.mbdata"
#macro log_previous_file			file_directory + "log_previous.txt"
#macro log_file						file_directory + "log.txt"
#macro temp_file					file_directory + "tmp.file"
#macro temp_image					file_directory + "tmp.png"
#macro unzip_directory				file_directory + "unzip\\"
#macro temp_model_directory			file_directory + "modeltemp\\"
#macro temp_model_backup			temp_model_directory + "\\" + "temp.mbbackup1"

// Minecraft color palette
#macro c_minecraft_white			hex_to_color("E9ECEC")
#macro c_minecraft_orange			hex_to_color("F07613")
#macro c_minecraft_magenta			hex_to_color("BD44B3")
#macro c_minecraft_light_blue		hex_to_color("3AAFD9")
#macro c_minecraft_yellow			hex_to_color("F8C627")
#macro c_minecraft_lime				hex_to_color("70B919")
#macro c_minecraft_pink				hex_to_color("ED8DAC")
#macro c_minecraft_gray				hex_to_color("3E4447")
#macro c_minecraft_light_gray		hex_to_color("8E8E86")
#macro c_minecraft_cyan				hex_to_color("158991")
#macro c_minecraft_purple			hex_to_color("792AAC")
#macro c_minecraft_blue				hex_to_color("35399D")
#macro c_minecraft_brown			hex_to_color("724728")
#macro c_minecraft_green			hex_to_color("546D1B")
#macro c_minecraft_red				hex_to_color("A12722")
#macro c_minecraft_black			hex_to_color("141519")

// Interface
#macro glow_alpha					0.45
#macro shadow_size					5
#macro shadow_alpha					0.1
#macro view_3d_control_size			0.225
#macro view_3d_control_width		20
#macro view_3d_box_size				12
#macro icon_button_offset			4

// Values
#macro null							noone
#macro no_limit						100000000
#macro TYPE_PART					0
#macro TYPE_SHAPE					1

// World
#macro world_size					30000

// Vectors and matrices
#macro X							0
#macro Y							1
#macro Z							2
#macro W							3
#macro MAT_X						12
#macro MAT_Y						13
#macro MAT_Z						14
#macro MAT_IDENTITY					matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1)
