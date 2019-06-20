/// tab_assets_textures()

// Preview selected texture
tab_control(160)
preview_draw(tex_preview, dx, dy, dw, 160)
tab_next()

var texturelist = ds_list_create();

with (obj_texture)
	ds_list_add(texturelist, id)

tab_control(ds_list_size(texturelist) * 48)
for (var i = 0; i < ds_list_size(texturelist); i++)
	draw_texture_item(dx, dy + (i * 48), dw, 48, texturelist[|i])
tab_next()

ds_list_destroy(texturelist)

// Add texture
tab_control(36)
draw_button_primary("assetsaddtexture", dx, dy, 0, null, e_icon.add, fa_center)
tab_next()
