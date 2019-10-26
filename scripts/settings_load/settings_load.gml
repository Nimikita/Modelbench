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

// General
var generalmap = map[?"general"];
if (ds_map_valid(generalmap))
{
	room_speed = value_get_real(generalmap[?"fps"], room_speed)
	
	setting_backup = value_get_real(generalmap[?"backup"], setting_backup)
	setting_backup_time = value_get_real(generalmap[?"backup_time"], setting_backup_time)
	setting_backup_amount = value_get_real(generalmap[?"backup_amount"], setting_backup_amount)
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
	
	setting_key_tool_select = value_get_real(controlsmap[?"key_tool_select"], setting_key_tool_select)
	setting_key_tool_select_control = value_get_real(controlsmap[?"key_tool_select_control"], setting_key_tool_select_control)
	setting_key_tool_move = value_get_real(controlsmap[?"key_tool_move"], setting_key_tool_move)
	setting_key_tool_move_control = value_get_real(controlsmap[?"key_tool_move_control"], setting_key_tool_move_control)
	setting_key_tool_rotate = value_get_real(controlsmap[?"key_tool_rotate"], setting_key_tool_rotate)
	setting_key_tool_rotate_control = value_get_real(controlsmap[?"key_tool_rotate_control"], setting_key_tool_rotate_control)
	setting_key_tool_scale = value_get_real(controlsmap[?"key_tool_scale"], setting_key_tool_scale)
	setting_key_tool_scale_control = value_get_real(controlsmap[?"key_tool_scale_control"], setting_key_tool_scale_control)
	setting_key_tool_transform = value_get_real(controlsmap[?"key_tool_transform"], setting_key_tool_transform)
	setting_key_tool_transform_control = value_get_real(controlsmap[?"key_tool_transform_control"], setting_key_tool_transform_control)
	
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
	
	setting_snap = value_get_real(controlsmap[?"snap"], setting_snap)
	setting_snap_size = value_get_real(controlsmap[?"snap_size"], setting_snap_size)
}

// Interface
var interfacemap = map[?"interface"];
if (ds_map_valid(interfacemap))
{
	var themename;
	themename = value_get_real(interfacemap[?"theme"], "light")
	
	with (obj_theme)
	{
		if (name = themename)
		{
			setting_theme = id
			break
		}
	}
	
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
}

// Graphics
var graphicsmap = map[?"graphics"];
if (ds_map_valid(graphicsmap))
{
	setting_blocky_bending = value_get_real(graphicsmap[?"blocky_bending"], setting_blocky_bending)
	setting_wind = value_get_real(graphicsmap[?"wind"], setting_wind)
	setting_wind_speed = value_get_real(graphicsmap[?"wind_speed"], setting_wind_speed)
	setting_wind_strength = value_get_real(graphicsmap[?"wind_strength"], setting_wind_strength)
}

// Render
var rendermap = map[?"render"];
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
