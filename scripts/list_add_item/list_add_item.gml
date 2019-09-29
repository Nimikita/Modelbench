/// list_add_item(name, value, caption, [thumbnail, left_icon, right_icon, script, [divider]])
/// @arg name
/// @arg value
/// @arg caption
/// @arg [thumbnail
/// @arg left_icon
/// @arg right_icon
/// @arg script
/// @arg [divider]]

var item, name, value, caption, thumbnail, lefticon, righticon, script, divider;
name = argument[0]
value = argument[1]
caption = argument[2]
thumbnail = null
lefticon = null
righticon = null
script = null
divider = false

if (argument_count > 3)
{
	thumbnail = argument[3]
	lefticon = argument[4]
	righticon = argument[5]
	script = argument[6]
}

if (argument_count > 7)
	divider = argument[7]

item = new(obj_listitem)
item.name = name
item.value = value
item.caption = caption
item.thumbnail = thumbnail

item.icon_left = lefticon
item.actions_left = null

item.icon_right = righticon
item.actions_right = null
item.script = script
item.hover = false
item.divider = divider
item.disabled = false

if (list_edit != null)
	ds_list_add(list_edit.item, item)

listitem_last = item

return item
