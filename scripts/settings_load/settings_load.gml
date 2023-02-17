/// settings_load()
/// @desc Formats:
///			ALPHA_2 = Initial

function settings_load()
{
	var fn = settings_file;
	
	if (!file_exists_lib(fn))
		return 0
	
	log("Loading settings", fn)
	
	// Decode
	var map = json_load(fn);
	if (!ds_map_valid(map))
		return 0
	
	if (!is_real(map[?"format"]))
		return 0
	
	load_format = map[?"format"];
	if (load_format > settings_format)
		return 0
	
	log("load_format", load_format)
	
	// General
	var generalmap = map[?"general"];
	if (ds_map_valid(generalmap))
	{
		room_speed = value_get_real(generalmap[?"fps"], room_speed)
		setting_feature_set = value_get_real(generalmap[?"feature_set"], setting_feature_set)
		
		setting_backup = value_get_real(generalmap[?"backup"], setting_backup)
		setting_backup_time = value_get_real(generalmap[?"backup_time"], setting_backup_time)
		setting_backup_amount = value_get_real(generalmap[?"backup_amount"], setting_backup_amount)
		
		setting_slow_generation = value_get_real(generalmap[?"slow_generation"], setting_slow_generation)
		setting_refresh_textures = value_get_real(generalmap[?"refresh_textures"], setting_refresh_textures)
	}
	
	// Controls
	var controlsmap = map[?"controls"];
	if (ds_map_valid(controlsmap) && load_format >= e_settings.FORMAT_111)
	{
		var obj;
		for (var i = 0; i < e_keybind.amount; i++)
		{
			obj = keybinds[i]
			obj.keybind = value_get_array(controlsmap[?obj.name], obj.keybind)
		}
		
		setting_look_sensitivity = value_get_real(controlsmap[?"look_sensitivity"], setting_look_sensitivity)
		setting_viewport_controls_middle = value_get_real(controlsmap[?"viewport_controls_middle"], setting_viewport_controls_middle)
		
		keybinds_update_match()
	}
	
	// Interface
	var interfacemap = map[?"interface"];
	if (ds_map_valid(interfacemap))
	{
		var themename;
		themename = value_get_string(interfacemap[?"theme"], "light")
		
		with (obj_theme)
		{
			if (name = themename)
			{
				app.setting_theme = id
				break
			}
		}
		
		setting_accent = value_get_real(interfacemap[?"accent_index"], setting_accent)
		setting_accent_custom = value_get_color(interfacemap[?"accent_custom"], setting_accent_custom)
		
		setting_language_filename = value_get_string(interfacemap[?"language_filename"], setting_language_filename)
		if (((languages_directory + setting_language_filename) != language_file) && file_exists_lib(languages_directory + setting_language_filename))
			language_load(languages_directory + setting_language_filename, language_map)
		
		setting_z_is_up = value_get_real(interfacemap[?"z_is_up"], setting_z_is_up)
		setting_shared_texture_uvs = value_get_real(interfacemap[?"shared_texture_uvs"], setting_shared_texture_uvs)
		
		setting_reduced_motion = value_get_real(interfacemap[?"reduced_motion"], setting_reduced_motion)
		
		setting_panel_left_size = value_get_real(interfacemap[?"panel_left_size"], setting_panel_left_size)
		setting_panel_right_size = value_get_real(interfacemap[?"panel_right_size"], setting_panel_right_size)
		setting_panel_left_secondary_size = value_get_real(interfacemap[?"panel_left_secondary_size"], setting_panel_left_secondary_size)
		setting_panel_right_secondary_size = value_get_real(interfacemap[?"panel_right_secondary_size"], setting_panel_right_secondary_size)
		
		setting_assets_location = value_get_string(interfacemap[?"assets_location"], setting_assets_location)
		setting_element_editor_location = value_get_string(interfacemap[?"element_editor_location"], setting_element_editor_location)
		
		setting_show_uv_editor = value_get_real(interfacemap[?"show_uv_editor"], setting_show_uv_editor)
		setting_uv_editor_size = value_get_real(interfacemap[?"uv_editor_size"], setting_uv_editor_size)
		setting_uv_editor_location = value_get_string(interfacemap[?"uv_editor_location"], setting_uv_editor_location)
		
		setting_adjust_pivot_resize = value_get_real(interfacemap[?"adjust_pivot_resize"], setting_adjust_pivot_resize)
		setting_show_shortcuts_bar = value_get_real(interfacemap[?"show_shortcuts_bar"], setting_show_shortcuts_bar)
	}
	
	// Render
	var rendermap = map[?"render"];
	if (ds_map_valid(rendermap))
	{
		setting_render_ao = value_get_real(rendermap[?"render_ao"], setting_render_ao)
		setting_render_shadows = value_get_real(rendermap[?"render_shadows"], setting_render_shadows)
		setting_render_aa = value_get_real(rendermap[?"render_aa"], setting_render_aa)
	}
	
	// Preview
	var previewmap = map[?"preview"];
	if (ds_map_valid(previewmap))
	{
		setting_preview_guides = value_get_real(previewmap[?"overlay"], setting_preview_guides)
		
		setting_preview_scenery = preview_scenery_find(value_get_string(previewmap[?"scenery"], ""))
		setting_preview_light_rotation = value_get_real(previewmap[?"light_rotation"], setting_preview_light_rotation)
		setting_preview_light_range = value_get_real(previewmap[?"light_range"], setting_preview_light_range)
		
		setting_preview_export_size = value_get_real(previewmap[?"export_size"], setting_preview_export_size)
		setting_preview_background = value_get_real(previewmap[?"background"], setting_preview_background)
	}
	
	// Viewport
	var viewportmap = map[?"viewport"];
	if (ds_map_valid(viewportmap))
	{
		setting_snap = value_get_real(viewportmap[?"snap"], setting_snap)
		setting_snap_absolute = value_get_real(viewportmap[?"snap_absolute"], setting_snap_absolute)
		setting_snap_size_position = value_get_real(viewportmap[?"snap_size_position"], setting_snap_size_position)
		setting_snap_size_rotation = value_get_real(viewportmap[?"snap_size_rotation"], setting_snap_size_rotation)
		setting_snap_size_scale = value_get_real(viewportmap[?"snap_size_scale"], setting_snap_size_scale)
		setting_snap_size_uv = value_get_real(viewportmap[?"snap_size_uv"], setting_snap_size_uv)
		
		setting_overlays = value_get_real(viewportmap[?"overlays"], setting_overlays)
		setting_overlays_grid = value_get_real(viewportmap[?"overlays_grid"], setting_overlays_grid)
		setting_overlays_gizmos = value_get_real(viewportmap[?"overlays_gizmos"], setting_overlays_gizmos)
		setting_overlays_highlights = value_get_real(viewportmap[?"overlays_highlights"], setting_overlays_highlights)
		setting_overlays_outlines = value_get_real(viewportmap[?"overlays_outlines"], setting_overlays_outlines)
		setting_overlays_outline_opacity = value_get_real(viewportmap[?"overlays_outline_opacity"], setting_overlays_outline_opacity)
		
		setting_wind = value_get_real(viewportmap[?"wind"], setting_wind)
		setting_wind_speed = value_get_real(viewportmap[?"wind_speed"], setting_wind_speed)
		setting_wind_strength = value_get_real(viewportmap[?"wind_strength"], setting_wind_strength)
		
		setting_render_mode = value_get_real(viewportmap[?"render_mode"], setting_render_mode)
		setting_shading = value_get_real(viewportmap[?"shading"], setting_shading)
		setting_shading_ao = value_get_real(viewportmap[?"shading_ao"], setting_shading_ao)
		setting_shading_lighting = value_get_real(viewportmap[?"shading_lighting"], setting_shading_lighting)
		
		setting_blocky_bending = value_get_real(viewportmap[?"blocky_bending"], setting_blocky_bending)
	}
	
	ds_map_destroy(map)
}
