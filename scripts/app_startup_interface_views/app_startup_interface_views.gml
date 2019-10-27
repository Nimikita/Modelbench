/// app_startup_interface_views()

view_area_x = 0
view_area_y = 0
view_area_width = 0
view_area_height = 0

view_click_x = 0
view_click_y = 0

view_main = new(obj_view)

view_control_update_rot[X] = true
view_control_update_rot[Y] = true
view_control_update_rot[Z] = true

view_control_edit = null
view_control_edit_view = null
view_control_vec = vec2(0, 0)
view_control_pos = vec2(0, 0)
view_control_flip = false
view_control_value = 0
view_control_value_add = 0
view_control_scale_coords = vec2(0)
view_control_scale_amount = 1
view_control_value_scale = vec3(1)

view_control_rot_points[X] = array()
view_control_rot_points[Y] = array()
view_control_rot_points[Z] = array()
