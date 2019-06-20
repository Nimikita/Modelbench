/// render_world_start([zfar])
/// @arg [zfar]

//if (!render_camera) // Use work camera
//{
	var xx, yy, zz, cx, cy;
	cam_from = point3D_copy(cam_work_from)
	cam_to[X] = cam_work_from[X] + lengthdir_x(1, cam_work_angle_look_xy + 180) * lengthdir_x(1, cam_work_angle_look_z)
	cam_to[Y] = cam_work_from[Y] + lengthdir_y(1, cam_work_angle_look_xy + 180) * lengthdir_x(1, cam_work_angle_look_z)
	cam_to[Z] = cam_work_from[Z] + lengthdir_z(1, cam_work_angle_look_z)
	
	xx = cam_to[X] - cam_from[X];
	yy = cam_to[Y] - cam_from[Y];
	zz = cam_to[Z] - cam_from[Z];
	cx = lengthdir_x(1, -cam_work_roll) / sqrt(xx * xx + yy * yy + zz * zz)
	cy = lengthdir_y(1, -cam_work_roll)
	cam_up[X] = -cx * xx * zz - cy * yy
	cam_up[Y] = cy * xx - cx * yy * zz
	cam_up[Z] = cx * (xx * xx + yy * yy)
	
	cam_fov = 35
//}

cam_near = 1
if (argument_count > 0)
	cam_far = argument[0]
else
	cam_far = world_size
	
gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
render_set_projection(cam_from, cam_to, cam_up, cam_fov, render_ratio, cam_near, cam_far)

proj_from = cam_from
render_proj_from = proj_from
proj_matrix = matrix_get(matrix_projection)
view_proj_matrix = matrix_multiply(matrix_get(matrix_view), matrix_get(matrix_projection))