/// texture_relink

var fn = file_dialog_open_image();

if (fn != "")
{
	if (file_exists_lib(fn))
	{
		sprite_delete(res.sprite)
		res.sprite = texture_create_square(fn)
	}
}