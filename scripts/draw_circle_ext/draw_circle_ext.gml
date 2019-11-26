/// draw_circle_ext(x, y, radius, outline, [color, alpha])
/// @arg x
/// @arg y
/// @arg radius
/// @arg outline
/// @arg [color
/// @arg alpha]

var xx, yy, radius, outline, color, alpha;
xx = argument[0]
yy = argument[1]
radius = argument[2]
outline = argument[3]
color = draw_get_color()
alpha = draw_get_alpha()

if (argument_count > 4)
{
	draw_set_color(argument[4])
	draw_set_alpha(alpha * argument[5])
}

draw_set_circle_precision(64)
draw_circle(xx, yy, radius, outline)

draw_set_color(color)
draw_set_alpha(alpha)
