/// tex_load()
/// @desc Loads a texture

var fn = load_folder + "//" + filename;

debug("Loading texture", fn)

if (sprite)
	texture_free(sprite)

filepath = fn
sprite = texture_create_square(fn)
size = point2D(sprite_get_width(sprite), sprite_get_height(sprite))
