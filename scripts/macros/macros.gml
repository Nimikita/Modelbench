/// macros()
/// @desc Defines constants used in the project.

function macros()
{
	// Debug
	#macro dev_mode						false
	#macro debug_export_normals			false
	
	// Versions
	#macro modelbench_version			"1.1.5"
	#macro modelbench_version_full		modelbench_version + " Alpha 2"
	#macro modelbench_version_extra		""
	#macro modelbench_version_date		"02.16.2022"
	#macro gm_runtime					GM_runtime_version

	// File formats
	#macro settings_format				e_settings.FORMAT_111
	
	// Directories
	#macro file_directory				game_save_id
	#macro data_directory				working_directory + "Data\\"
	#macro models_directory				working_directory + "Models\\"
	#macro fonts_directory				data_directory + "Fonts\\"
	#macro languages_directory			data_directory + "Languages\\"
	#macro templates_directory			data_directory + "Templates\\"
	#macro textures_directory			data_directory + "Textures\\"
	
	// Files
	#macro language_file				languages_directory + "english.mblanguage"
	#macro settings_file				data_directory + "settings.mbdata"
	#macro recent_file					data_directory + "recent.mbdata"
	#macro scenery_file					data_directory + "scenery.mbdata"
	#macro log_previous_file			file_directory + "log_previous.txt"
	#macro log_file						file_directory + "log.txt"
	#macro temp_model_directory			file_directory + "modeltemp\\"
	#macro temp_model_backup			temp_model_directory + "\\" + "temp.mbbackup1"
	#macro temp_file					file_directory + "tmp.file"
	#macro temp_image					file_directory + "tmp.png"
	
	// Links
	#macro link_news					"https://www.mineimator.com/news?app=mb&version=" + modelbench_version
	#macro link_forums					"https://www.mineimatorforums.com/index.php?/forum/53-modelbench-discussion/"
	#macro link_forums_bugs				"https://www.mineimatorforums.com/index.php?/forum/55-modelbench-issues-and-bugs/&do=add"
	#macro http_ok						200
	
	// Interface
	#macro glow_alpha					0.45
	#macro shadow_size					5
	#macro shadow_alpha					0.1
	#macro view_3d_control_size			0.125
	#macro view_3d_control_width		20
	#macro icon_button_offset			4
	#macro snap_min						0.000001
	#macro label_height					9
	#macro dragger_width				74
	
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
}
