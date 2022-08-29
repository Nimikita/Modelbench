/// tex_load([fn])
/// @arg [fn]
/// @desc Loads a texture

function tex_load()
{
	var fn;
	
	if (argument_count = 0)
		fn = load_folder + "//" + filename
	else
		fn = argument[0]
	
	debug("Loading texture", fn)
	
	if (sprite)
		texture_free(sprite)
	
	filepath = fn
	sprite = texture_create_square(fn)
	size = point2D(sprite_get_width(sprite), sprite_get_height(sprite))
}
