/// app_startup_interface_popups()

// Colorpicker
popup_colorpicker = new_popup("colorpicker", popup_colorpicker_draw, 228, 440, false)
with (popup_colorpicker)
{
	value_name = ""
	value_script = null
	color = null
	def = null
	hue = 0
	saturation = 0
	value = 0
	tbx_red = new_textbox(1, 3, "0123456789")
	tbx_green = new_textbox(1, 3, "0123456789")
	tbx_blue = new_textbox(1, 3, "0123456789")
	tbx_hue = new_textbox(1, 3, "0123456789")
	tbx_saturation = new_textbox(1, 3, "0123456789")
	tbx_brightness = new_textbox(1, 3, "0123456789")
	tbx_hexadecimal = new_textbox(1, 6, "0123456789ABCDEFabcdef")
	tbx_red.next_tbx = tbx_green
	tbx_green.next_tbx = tbx_blue
	tbx_blue.next_tbx = tbx_hexadecimal
	tbx_hexadecimal.next_tbx = tbx_red
}

// About popup
popup_about = new_popup("about", popup_about_draw, 542, 480, false)

// OBJ export popup
popup_export = new_popup("export", popup_export_draw, 300, 94, true)
