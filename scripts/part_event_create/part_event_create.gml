/// part_event_create()
/// @desc Create event of a part.

name = ""
display_name = ""
color = make_color_hsv(random(255), 255, 255)
res = null
depth = 0

part_list = null
shape_list = null

hidden = false
locked = false

for (var v = 0; v < e_value.amount; v++)
{
	value_default[v] = app.value_default[v]
	value_inherit[v] = value_default[v]
	value[v] = value_default[v]
}