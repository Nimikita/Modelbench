/// render_world_start([zfar])
/// @arg [zfar]

var xx, yy, zz, cx, cy;
cam_from = point3D_copy(view_cam.from)
cam_to[X] = view_cam.from[X] + lengthdir_x(1, view_cam.angle_look_xy + 180) * lengthdir_x(1, view_cam.angle_look_z)
cam_to[Y] = view_cam.from[Y] + lengthdir_y(1, view_cam.angle_look_xy + 180) * lengthdir_x(1, view_cam.angle_look_z)
cam_to[Z] = view_cam.from[Z] + lengthdir_z(1, view_cam.angle_look_z)
	
xx = cam_to[X] - cam_from[X];
yy = cam_to[Y] - cam_from[Y];
zz = cam_to[Z] - cam_from[Z];
cx = lengthdir_x(1, -view_cam.roll) / sqrt(xx * xx + yy * yy + zz * zz)
cy = lengthdir_y(1, -view_cam.roll)
cam_up[X] = -cx * xx * zz - cy * yy
cam_up[Y] = cy * xx - cx * yy * zz
cam_up[Z] = cx * (xx * xx + yy * yy)
	
cam_fov = 35

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
view_matrix = matrix_get(matrix_view)
proj_matrix = matrix_get(matrix_projection)
view_proj_matrix = matrix_multiply(view_matrix, proj_matrix)
