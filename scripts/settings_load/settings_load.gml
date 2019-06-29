/// settings_load()
/// @desc Formats:
///			ALPHA_2 = Initial

var fn = settings_file;

if (!file_exists_lib(fn))
	fn = data_directory + "settings.file"

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

// Program
var programmap = map[?"program"];
if (ds_map_valid(programmap))
{
	room_speed = value_get_real(programmap[?"fps"], room_speed)
	
	setting_backup = value_get_real(programmap[?"backup"], setting_backup)
	setting_backup_time = value_get_real(programmap[?"backup_time"], setting_backup_time)
	setting_backup_amount = value_get_real(programmap[?"backup_amount"], setting_backup_amount)
}

// Controls
var controlsmap = map[?"controls"];
if (ds_map_valid(controlsmap))
{
	setting_key_open = value_get_real(controlsmap[?"key_open"], setting_key_open)
	setting_key_open_control = value_get_real(controlsmap[?"key_open_control"], setting_key_open_control)
	setting_key_save = value_get_real(controlsmap[?"key_save"], setting_key_save)
	setting_key_save_control = value_get_real(controlsmap[?"key_save_control"], setting_key_save_control)
	setting_key_undo = value_get_real(controlsmap[?"key_undo"], setting_key_undo)
	setting_key_undo_control = value_get_real(controlsmap[?"key_undo_control"], setting_key_undo_control)
	setting_key_redo = value_get_real(controlsmap[?"key_redo"], setting_key_redo)
	setting_key_redo_control = value_get_real(controlsmap[?"key_redo_control"], setting_key_redo_control)
	
	setting_key_forward = value_get_real(controlsmap[?"key_forward"], setting_key_forward)
	setting_key_back = value_get_real(controlsmap[?"key_back"], setting_key_back)
	setting_key_left = value_get_real(controlsmap[?"key_left"], setting_key_left)
	setting_key_right = value_get_real(controlsmap[?"key_right"], setting_key_right)
	setting_key_ascend = value_get_real(controlsmap[?"key_ascend"], setting_key_ascend)
	setting_key_descend = value_get_real(controlsmap[?"key_descend"], setting_key_descend)
	setting_key_reset = value_get_real(controlsmap[?"key_reset"], setting_key_reset)
	setting_key_fast = value_get_real(controlsmap[?"key_fast"], setting_key_fast)
	setting_key_slow = value_get_real(controlsmap[?"key_slow"], setting_key_slow)
	
	setting_smooth_camera = value_get_real(controlsmap[?"smooth_camera"], setting_smooth_camera)
	setting_smooth_camera_amount = value_get_real(controlsmap[?"smooth_camera_amount"], setting_smooth_camera_amount)
}

// Interface
var interfacemap = map[?"interface"];
if (ds_map_valid(interfacemap))
{
	setting_dark_theme = value_get_real(interfacemap[?"dark_theme"], setting_dark_theme)
	setting_accent = value_get_real(interfacemap[?"accent_index"], setting_accent)
	setting_accent_custom = value_get_color(interfacemap[?"accent_custom"], setting_accent_custom)
	setting_z_is_up = value_get_real(interfacemap[?"z_is_up"], setting_z_is_up)
	setting_outline_opacity = value_get_real(interfacemap[?"outline_opacity"], setting_outline_opacity)

	setting_panel_left_size = value_get_real(interfacemap[?"panel_left_size"], setting_panel_left_size)
	setting_panel_right_size = value_get_real(interfacemap[?"panel_right_size"], setting_panel_right_size)
	setting_panel_left_secondary_size = value_get_real(interfacemap[?"panel_left_secondary_size"], setting_panel_left_secondary_size)
	setting_panel_right_secondary_size = value_get_real(interfacemap[?"panel_right_secondary_size"], setting_panel_right_secondary_size)

	setting_assets_location = value_get_string(interfacemap[?"assets_location"], setting_assets_location)
	setting_element_editor_location = value_get_string(interfacemap[?"element_editor_location"], setting_element_editor_location)
	setting_settings_location = value_get_string(interfacemap[?"element_editor_location"], setting_settings_location)
}

// Graphics
var graphicsmap = map[?"graphcs"];
if (ds_map_valid(graphicsmap))
{
	setting_blocky_bending = value_get_real(graphicsmap[?"blocky_bending"], setting_blocky_bending)
	setting_wind = value_get_real(graphicsmap[?"wind"], setting_wind)
	setting_wind_speed = value_get_real(graphicsmap[?"wind_speed"], setting_wind_speed)
	setting_wind_strength = value_get_real(graphicsmap[?"wind_strength"], setting_wind_strength)
}

// Render
var rendermap = map[?"graphcs"];
if (ds_map_valid(rendermap))
{
	setting_render_ssao = value_get_real(rendermap[?"render_ssao"], setting_render_ssao)
	setting_render_ssao_radius = value_get_real(rendermap[?"render_ssao_radius"], setting_render_ssao_radius)
	setting_render_ssao_power = value_get_real(rendermap[?"render_ssao_power"], setting_render_ssao_power)
	setting_render_ssao_blur_passes = value_get_real(rendermap[?"render_ssao_blur_passes"], setting_render_ssao_blur_passes)
	
	setting_render_shadows = value_get_real(rendermap[?"render_shadows"], setting_render_shadows)
	setting_render_shadows_blur_quality = value_get_real(rendermap[?"render_shadows_blur_quality"], setting_render_shadows_blur_quality)
	setting_render_shadows_blur_size = value_get_real(rendermap[?"render_shadows_blur_size"], setting_render_shadows_blur_size)
}
ds_map_destroy(map)
