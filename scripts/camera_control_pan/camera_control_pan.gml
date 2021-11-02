/// camera_control_pan()

var mx, my, move;
mx = -((mouse_x - mouse_previous_x) / 8) * (.075 * (view_cam.zoom/50))
my = ((mouse_y - mouse_previous_y) / 8) * (.075 * (view_cam.zoom/50))
move = 4 * setting_move_speed

app_mouse_wrap(content_x, content_y, content_width, content_height)

// Create matrix
var mat = matrix_create(vec3(0, 0, 0), vec3(view_cam.angle_look_z, 0, view_cam.angle_look_xy + 90), vec3(1));
var vert = vec3_mul_matrix(vec3(mx * move, 0, my * move), mat);

view_cam.from[X] += vert[X]
view_cam.from[Y] += vert[Y]
view_cam.from[Z] += vert[Z]

camera_set_angle()
