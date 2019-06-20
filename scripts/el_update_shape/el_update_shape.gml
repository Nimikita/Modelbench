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

// Colors
color_inherit = value[e_value.INHERIT_COLOR]
color_blend = value[e_value.BLEND_COLOR]
color_alpha = value[e_value.OPACITY]
color_brightness = value[e_value.BRIGHTNESS]
color_mix = value[e_value.MIX_COLOR]
color_mix_percent = value[e_value.MIX_PERCENT]

// Shape appearance
texture_mirror = value[e_value.TEX_MIRROR]
invert = value[e_value.INVERT]
hide_backface = value[e_value.HIDE_BACKFACE]
face_camera = value[e_value.FACE_CAMERA]
item_bounce = value[e_value.HOVER]

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

// Bending
bend_shape = value[e_value.BEND]
bend_part = other.bend_part
bend_axis = other.bend_axis
bend_direction = other.bend_direction
bend_default_angle = other.bend_default_angle
bend_offset = other.bend_offset
bend_size = other.bend_size
bend_invert = other.bend_invert

// Create matrix
matrix = matrix_create(position, vec3(0), vec3(1))

// UV
wind_wave = value[e_value.WIND_WAVE]
wind_wave_zmin = test(value[e_value.WIND_ZMIN_ENABLE], value[e_value.WIND_ZMIN], null)
wind_wave_zmax = test(value[e_value.WIND_ZMAX_ENABLE], value[e_value.WIND_ZMAX], null)
