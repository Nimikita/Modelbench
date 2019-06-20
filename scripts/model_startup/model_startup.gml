/// model_startup()

globalvar load_folder, save_folder, el_edit, el_edit_amount, res_edit,
		  axis_edit, blank_texture;

el_edit = null
el_edit_amount = 0
res_edit = null
axis_edit = null

blank_texture = texture_sprite(spr_empty)

part_list = null
shape_list = null
res = null

model_name = ""
player_skin = true
root_scale = 1