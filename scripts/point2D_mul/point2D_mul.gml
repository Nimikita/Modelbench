/// point2D_mul(point, multiplier)
/// @arg point
/// @arg multiplier

function point2D_mul(pnt, mul)
{
	if (is_array(mul))
		return [pnt[@ X] * mul[@ X], pnt[@ Y] * mul[@ Y]]
	else
		return [pnt[@ X] * mul, pnt[@ Y] * mul]
}