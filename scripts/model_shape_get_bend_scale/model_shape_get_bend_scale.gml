/// model_shape_get_bend_scale(bendstart, bendend, segmentpoint, start, [segmentposition], [bend])
/// @arg bendstart
/// @arg bendend
/// @arg segmentpoint
/// @arg start
/// @arg [segmentposition]
/// @arg [bend]

/// @desc Returns a scaling for blocky bending to adjust pinching.

var bendstart, bendend, segpoint, start, segpos, bend;
bendstart = argument[0]
bendend = argument[1]
segpoint = argument[2]
start = argument[3]
segpos = null
bend = bend_default_angle

if (argument_count > 4)
	segpos = argument[4]

if (argument_count > 5)
	bend = argument[5]

var bendscale;

if (segpos > bendstart && segpos < bendend)
{
	if (segpoint <= 0.5)
		bendscale = vec3(segpoint * 2)
	else
		bendscale = vec3((1 - segpoint) * 2)
	
	var bendaxis, bendang;
	if (vec3_equals(bend_axis, vec3(true, false, false)))
		bendaxis = X
	else if (vec3_equals(bend_axis, vec3(false, true, false)))
		bendaxis = Y
	
	bendang = abs(bend[bendaxis])
	
	if (bendang > 90)
		bendang -= (bendang - 90) * 2
	
	var bendperc = percent(bendang, 0, 90);
	bendperc = clamp(bendperc, 0, 1)
	bendscale = vec3_mul(bendscale, bendperc)
	
	for (var i = X; i <= Z; i++)
		bendscale[i] = ease("easeincubic", bendscale[i])
		
	bendscale = vec3_div(bendscale, 2.5)

	bendscale[bendaxis] = 0
	
	return bendscale
}
else
	return vec3(0)