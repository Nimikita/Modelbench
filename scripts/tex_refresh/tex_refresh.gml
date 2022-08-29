/// tex_refresh(tex)
/// @arg tex
/// @desc Refreshes a texture file based on file path

function tex_refresh(tex)
{
	with (tex)
	{
		if (filepath != "" && file_exists_lib(filepath))
		{
			sprite_delete(sprite)
			sprite = texture_create_square(filepath)
		}
	}
}
