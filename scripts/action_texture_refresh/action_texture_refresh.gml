/// action_texture_refresh()

var texobj = context_menu_value;

tex_refresh(texobj)

textures_list.update = true

if (texobj = res_edit)
{
	tex_preview.update = true
	tex_preview.reset_view = true
}
