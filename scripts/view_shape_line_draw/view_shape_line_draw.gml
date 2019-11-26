/// view_shape_line_draw(point1, point2)
/// @arg point1
/// @arg point2

var point1, point2;
point1 = argument0
point2 = argument1

render_set_culling(false)
draw_line_width(point1[@ X] * 2, point1[@ Y] * 2, point2[@ X] * 2, point2[@ Y] * 2, 7)
render_set_culling(true)
