/// textfield_group_add(name, value, default, script, axis, textbox)
/// @arg name
/// @arg value
/// @arg default
/// @arg script
/// @arg axis
/// @arg textbox

textfield_name = array_add(textfield_name, argument[0])
textfield_value = array_add(textfield_value, argument[1])
textfield_default = array_add(textfield_default, argument[2])
textfield_script = array_add(textfield_script, argument[3])
textfield_axis = array_add(textfield_axis, argument[4])
textfield_textbox = array_add(textfield_textbox, argument[5])
textfield_amount = array_length_1d(textfield_name)
