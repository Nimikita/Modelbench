/// shader_shape_outline_set(shapesurf, normalssurf)
/// @arg shapesurf
/// @arg normalsurf

texture_set_stage(sampler_map[?"uShapeBuffer"], surface_get_texture(argument0))
texture_set_stage(sampler_map[?"uNormalBuffer"], surface_get_texture(argument1))

render_set_uniform_vec2("uTexSize", render_width, render_height)
render_set_uniform("uStrength", 1.0 - app.setting_overlays_outline_opacity)