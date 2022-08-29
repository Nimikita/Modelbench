/// action_el_face_camera(face_camera)
/// @arg face_camera

function action_el_face_camera(face_camera)
{
	el_value_set_start(action_el_face_camera, false)
	el_value_set(e_value.FACE_CAMERA, face_camera, false)
	el_value_set_done()
}
