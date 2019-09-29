/// tex_load()
/// @desc Loads a texture

var fn = load_folder + "//" + filename;

debug("Loading texture", fn)

if (sprite)
	texture_free(sprite)

sprite = texture_create(fn)
scale = 1
size = point2D(sprite_get_width(sprite), sprite_get_height(sprite))
