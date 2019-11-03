/// el_update_shape()
/// @desc Updates shape generation values based on edit values

// Position(No scale)
position_noscale = point3D(value[e_value.POS_X], value[e_value.POS_Y], value[e_value.POS_Z])

// Position
position = point3D_mul(position_noscale, other.scale)

// Rotation
rotation = point3D(value[e_value.ROT_X], value[e_value.ROT_Y], value[e_value.ROT_Z])

// Scale
scale = point3D(value[e_value.SCA_X], value[e_value.SCA_Y], value[e_value.SCA_Z])
scale = vec3_mul(scale, other.scale)

// Texture
if (value[e_value.TEXTURE_OBJ] = null)
	res = parent.res
else
	res = value[e_value.TEXTURE_OBJ]

if (res = null)
	texture_size = vec2(sprite_get_width(spr_empty))
else
	texture_size = vec2_div(vec2(sprite_get_width(res.sprite)), res.scale)

// Colors
color_inherit = value[e_value.INHERIT_COLOR]
color_blend = value[e_value.BLEND_COLOR]
color_alpha = value[e_value.OPACITY]
color_brightness = value[e_value.BRIGHTNESS]
color_mix = value[e_value.MIX_COLOR]
color_mix_percent = value[e_value.MIX_AMOUNT]

if (other.object_index != app && color_inherit)
{
	color_blend = color_multiply(color_blend, other.color_blend)
	color_alpha *= other.color_alpha
	color_brightness = clamp(color_brightness + other.color_brightness, 0, 1)
	color_mix = color_add(color_mix, other.color_mix)
	color_mix_percent = clamp(color_mix_percent + other.color_mix_percent, 0, 1)
}

// Shape appearance
texture_mirror = value[e_value.TEX_MIRROR]
invert = value[e_value.INVERT]
hide_backface = value[e_value.HIDE_BACKFACE]
face_camera = value[e_value.FACE_CAMERA]
item_bounce = value[e_value.HOVER]

// Update shape FROM/TO from offset and editor size
value[e_value.FROM_X] = value[e_value.OFFSET_X]
value[e_value.FROM_Y] = value[e_value.OFFSET_Y]
value[e_value.FROM_Z] = value[e_value.OFFSET_Z]

value[e_value.TO_X] = value[e_value.OFFSET_X] + value[e_value.WIDTH]
value[e_value.TO_Y] = value[e_value.OFFSET_Y] + value[e_value.LENGTH]
value[e_value.TO_Z] = value[e_value.OFFSET_Z] + value[e_value.HEIGHT]

// Shape size
from_noscale = point3D(value[e_value.FROM_X], value[e_value.FROM_Y], value[e_value.FROM_Z])
to_noscale = point3D(value[e_value.TO_X], value[e_value.TO_Y], value[e_value.TO_Z])
if (type = "plane")
	to_noscale[Y] = from_noscale[Y]

inflate = vec3(value[e_value.INFLATE])
if (type = "plane")
	inflate[Y] = 0

from = point3D_mul(point3D_sub(from_noscale, inflate), scale)
to = point3D_mul(point3D_add(to_noscale, inflate), scale)

// UV
uv = vec2(value[e_value.UV_X], value[e_value.UV_Y])

// Bending
bend_shape = value[e_value.BEND_SHAPE]
bend_part = other.bend_part
bend_axis = other.bend_axis
bend_direction_min = other.bend_direction_min
bend_direction_max = other.bend_direction_max
bend_default_angle_prev = other.bend_default_angle_prev
bend_default_angle = other.bend_default_angle
bend_offset = other.bend_offset
bend_size = other.bend_size
bend_invert = other.bend_invert

if (!vec3_equals(bend_default_angle, bend_default_angle_prev))
	update_vbuffer = true

// Create matrix
matrix = matrix_create(position, vec3(0), vec3(1))
matrix_parent = matrix_multiply(matrix, other.matrix_parent)

// Set world position
world_pos = point3D(matrix_parent[MAT_X], matrix_parent[MAT_Y], matrix_parent[MAT_Z])

// UV
wind_wave = value[e_value.WIND_AXIS]
wind_wave_zmin = test(value[e_value.WIND_ZMIN_ENABLE], value[e_value.WIND_ZMIN], null)
wind_wave_zmax = test(value[e_value.WIND_ZMAX_ENABLE], value[e_value.WIND_ZMAX], null)
