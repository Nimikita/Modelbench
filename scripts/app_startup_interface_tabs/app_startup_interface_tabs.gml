/// app_startup_interface_tabs()

tab_move = null
tab_move_name = ""
tab_move_x = 0
tab_move_width = 0
tab_move_direction = e_scroll.VERTICAL
tab_move_box_x = 0
tab_move_box_y = 0
tab_move_box_width = 0
tab_move_box_height = 0
tab_move_mouseon_panel = null
tab_move_mouseon_position = 0

// Assets
assets = new_tab(setting_assets_location, true)
with (assets)
{
	// Model properties
	model_properties = tab_add_category("modelproperties", tab_assets_model_properties, false)
	with (model_properties)
	{
		tbx_model_name = new_textbox(true, 0, "")
		tbx_model_scale = new_textbox_decimals()
		tbx_model_scale.suffix = "%"
	}
	
	// Elements
	elements = tab_add_category("elements", tab_assets_elements, false)
	
	// Textures
	textures = tab_add_category("textures", tab_assets_textures, false)
	with (textures)
	{
		preview = new(obj_preview)
	}
}

tex_preview = assets.textures.preview

// Element editor
element_editor = new_tab(setting_element_editor_location, false, header_element_editor)
with (element_editor)
{
	tbx_name = new_textbox(true, 0, "")
	tbx_depth = new_textbox_integer()
	
	// Position
	position = tab_add_category("position", null, false)
	
	// Pivot offset
	pivot_offset = tab_add_category("pivotoffset", null, false)
	
	// Rotation
	rotation = tab_add_category("rotation", null, false)
	
	// Size
	size = tab_add_category("size", null, false)
	
	// Scale
	scale = tab_add_category("scale", null, false)
	
	// Bend
	bend = tab_add_category("bend", null, false)
	
	// Material
	material = tab_add_category("material", null, false)
	
	// Appearance
	appearance = tab_add_category("appearance", null, false)
	
	// Wind
	wind = tab_add_category("wind", null, false)
	
	// Mine-imator
	mineimator = tab_add_category("mineimator", null, false)
}

// Settings
settings = new_tab(setting_element_editor_location, true)
with (settings)
{
	// Program
	program = tab_add_category("program", tab_settings_program, false)
	with (program)
	{
		tbx_backup_time = new_textbox_integer()
		tbx_backup_amount = new_textbox_integer()
	}
	
	// Controls
	controls = tab_add_category("controls", tab_settings_controls, false)
	with (controls)
	{
		tbx_smooth_camera_amount = new_textbox_integer()
	}
	
	// Interface
	interface = tab_add_category("interface", tab_settings_interface, false)
	with (interface)
	{
		tbx_outline_opacity = new_textbox_integer()
		tbx_outline_opacity.suffix = "%"
	}
	
	// Graphics
	graphics = tab_add_category("graphics", tab_settings_graphics, false)
	with (graphics)
	{
		tbx_wind_speed = new_textbox_integer()
		tbx_wind_speed.suffix = "%"
		tbx_wind_strength = new_textbox_decimals()
	}
	
	// Accessibility
	accessibility = tab_add_category("accessibility", null, false)
	
	// Render
	render = tab_add_category("render", tab_settings_render, false)
	with (render)
	{
		tbx_ssao_radius = new_textbox_integer()
		tbx_ssao_power = new_textbox_integer()
		tbx_ssao_power.suffix = "%"
		tbx_ssao_blur_passes = new_textbox_integer()
		
		tbx_shadows_blur_quality = new_textbox_integer()
		tbx_shadows_blur_size = new_textbox_integer()
		tbx_shadows_blur_size.suffix = "%"
	}
}