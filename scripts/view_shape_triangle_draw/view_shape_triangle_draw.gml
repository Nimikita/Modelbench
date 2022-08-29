/// view_shape_triangle_draw(p1, p2, p3)
/// @arg p1
/// @arg p2
/// @arg p3

function view_shape_triangle_draw(p1, p2, p3)
{
	var color, alpha;
	color = draw_get_color()
	alpha = draw_get_alpha()
	
	draw_vertex_color(p1[X] * 2, p1[Y] * 2, color, alpha)
	draw_vertex_color(p2[X] * 2, p2[Y] * 2, color, alpha)
	draw_vertex_color(p3[X] * 2, p3[Y] * 2, color, alpha)
}
