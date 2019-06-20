/// vbuffer_add_line(pos, pos2, color)
/// @arg pos
/// @arg pos2
/// @arg color

var pos, pos2, color;
pos = argument0
pos2 = argument1
color = argument2

vertex_add(pos, vec3(0), vec2(0), color, 1)
vertex_add(pos2, vec3(0), vec2(0), color, 1)
