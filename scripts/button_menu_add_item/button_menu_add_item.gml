/// button_menu_add_item(value, text, icon, script)
/// @arg value
/// @arg text
/// @arg icon
/// @arg script

var item = new(obj_menuitem);
item.value = argument0
item.text = argument1
item.icon = argument2
item.script = argument3

button_menu_w = max(button_menu_w, 32 + string_width_font(item.text, font_value) + 8)

app.button_menu_item[app.button_menu_amount] = item
app.button_menu_amount++