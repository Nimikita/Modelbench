/// radiobutton_group_set(groupobj)
/// @arg groupobj
/// @desc Sets a radio button group OBJ to keep track of a radio button group

radiobutton_group = argument0
radiobutton_group.hover = false

mcroani_arr[e_mcroani.RADIO_HOVER] = radiobutton_group.hover_ani_ease
mcroani_arr[e_mcroani.RADIO_HOVER_LINEAR] = radiobutton_group.hover_ani
