/// popup_export_draw()

dx += 8
dy += 8
dw -= 16
dh -= 16

dy += 8
var p = ((export_generation_done/export_generation_max) * .2) + ((export_compile_done/export_compile_max) * .4) + ((export_face_done/export_face_max) * .4);

draw_label(text_get("exportstagetotal"), dx, dy, fa_left, fa_center, c_text_secondary, a_text_secondary, font_value)
draw_label(text_get("exportstagedone", string(p * 100)), dx + dw, dy, fa_right, fa_center, c_text_secondary, a_text_secondary, font_value)
dy += 16

draw_box(dx, dy, dw, 8, false, c_border, a_border)
draw_box(dx, dy, dw * p, 8, false, c_accent, 1)

dy += 24

if (export_stage = "generation")
	p = export_generation_done/export_generation_max
else if (export_stage = "compile")
	p = export_compile_done/export_compile_max
else if (export_stage = "face")
	p = export_face_done/export_face_max

draw_label(text_get("exportstage" + export_stage), dx, dy, fa_left, fa_center, c_text_secondary, a_text_secondary, font_value)
draw_label(text_get("exportstagedone", string(p * 100)), dx + dw, dy, fa_right, fa_center, c_text_secondary, a_text_secondary, font_value)
dy += 16

draw_box(dx, dy, dw, 8, false, c_border, a_border)
draw_box(dx, dy, dw * p, 8, false, c_accent, 1)
