/// box_intersect(x1, y1, w1, h1, x2, y2, w2, h2)
/// @arg x1
/// @arg y1
/// @arg w1
/// @arg h1
/// @arg x2
/// @arg y2
/// @arg w2
/// @arg h2

var x1, y1, w1, h1, x2, y2, w2, h2;
x1 = argument0
y1 = argument1
w1 = argument2
h1 = argument3
x2 = argument4
y2 = argument5
w2 = argument6
h2 = argument7

if (x1 > (x2 + w2))
	return false

if (y1 > (y2 + h2))
	return false

if ((x1 + w1) < x2)
	return false
	
if ((y1 + h1) < y2)
	return false

return true
