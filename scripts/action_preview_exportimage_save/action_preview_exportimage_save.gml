/// action_preview_exportimage_save()

var fn, surf;
fn = file_dialog_save_image(model_name)

if (fn = "")
	return 0

log("Export image", fn)

log("Size", setting_preview_export_size)

// Render and save
render_start(null, null, setting_preview_export_size, setting_preview_export_size)

render_high()

surf = render_done()

surface_save(surf, fn)

// Clean up
render_free()
surface_free(surf)

snackbar_save_image(fn)
