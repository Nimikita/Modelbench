/// vbuffer_done([vbuffer, [tangents]])
/// @arg [vbuffer
/// @arg [tangents]]

function vbuffer_done()
{
	var vbuffer, tangents;
	vbuffer = vbuffer_current
	tangents = true
	
	if (argument_count > 0)
	{
		if (argument[0] != null)
			vbuffer_current = argument[0]
	}
	
	if (argument_count > 1)
		tangents = argument[1]
	
	vertex_end(vbuffer)
	
	if (tangents)
		vbuffer = vbuffer_generate_tangents(vbuffer)
	
	if (vbuffer_freeze)
		vertex_freeze(vbuffer)
	
	return vbuffer
}