/// tab_add_category(name, script, show)
/// @arg name
/// @arg script
/// @arg show

function tab_add_category(argument0, argument1, argument2)
{
	var cat = new_obj(obj_category);
	
	category[category_amount] = cat
	category_amount++
	
	with (cat)
	{
		name = argument0
		script = argument1
		show = argument2
		enabled = true
		copy = null
		
		return id
	}
}
