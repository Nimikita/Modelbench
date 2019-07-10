/// view_click(view, camera)
/// @arg view
/// @arg camera

var view, cam, surf;
view = argument0
cam = argument1
surf = surface_create(content_width, content_height)

render_camera = cam
render_ratio = content_width / content_height

surface_set_target(surf)
{
	draw_clear(c_black)
	render_world_start()
	render_world(e_render_mode.CLICK)
	render_world_done()
}
surface_reset_target()

var el = surface_getpixel(surf, mouse_x - content_x, mouse_y - content_y);
if (el > 0)
{
	// Find element to select
	if (!el_edit && !keyboard_check(vk_control))
		while (el.parent.object_index != app && !el.parent.tree_locked)
			el = el.parent
			
	// Select
	action_el_select(el)
	
	// Jump in list
	if (true)
	{
		assets.elements.show = true
	}
}
else
	if (!keyboard_check(vk_shift))
		action_el_deselect_all()
	
surface_free(surf)
