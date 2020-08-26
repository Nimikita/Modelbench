/// uv_editor_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

var boxx, boxy, boxw, boxh;
var texx, texy, texw, texh;

// Calculate box
boxx = argument0
boxy = argument1
boxw = argument2
boxh = argument3

texx = 0
texy = 0
texw = 1
texh = 1

boxx = floor(boxx)
boxy = floor(boxy)
boxw = floor(boxw)
boxh = floor(boxh)

if (boxw < 1 || boxh < 1)
	return 0

content_x = boxx
content_y = boxy
content_width = boxw
content_height = boxh
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon

// Add shortcuts
if (content_mouseon || window_busy = "uveditormove")
{
	if (uv_editor_xy_mouseon)
		shortcut_bar_add(null, e_mouse.LEFT_DRAG, "uveditoredituvs")
	else if (uv_editor_wh_mouseon)
		shortcut_bar_add(null, e_mouse.LEFT_DRAG, "uveditoreditwidthheight")
	else if(uv_editor_length_mouseon)
		shortcut_bar_add(null, e_mouse.LEFT_DRAG, "uveditoreditlength")
	else
		shortcut_bar_add(null, e_mouse.LEFT_DRAG, "panview")
	
	if (el_edit != null && el_edit.element_type = TYPE_SHAPE)
		shortcut_bar_add(new_shortcut("", true, false), e_mouse.LEFT_DRAG, "uveditorboxuvs")
	
	shortcut_bar_add(null, e_mouse.SCROLL, "zoom")
	
	shortcut_bar_add(null, e_mouse.RIGHT_CLICK, "contextmenuuveditor")
}

// Context menu
context_menu_area(content_x, content_y, content_width, content_height, "contextmenuuveditor")

// Dragging controls
if (uv_editor_mouseon && content_mouseon)
{
	if (mouse_left_pressed)
	{
		window_busy = "uveditormove"
		window_focus = "uveditor"
		uv_editor_click_x = uv_editor_x
		uv_editor_click_y = uv_editor_y
	}
}

if (window_focus = "uveditor")
{
	if (window_busy = "uveditormove")
	{
		mouse_cursor = cr_size_all
		
		uv_editor_x += (mouse_previous_x - mouse_x) / uv_editor_zoom
		uv_editor_y += (mouse_previous_y - mouse_y) / uv_editor_zoom
		
		app_mouse_wrap(content_x, content_y, content_width, content_height)
		
		uv_editor_goal_x = uv_editor_x
		uv_editor_goal_y = uv_editor_y
		if (!mouse_left)
		{
			window_busy = ""
			app_mouse_clear()
		}
	}
}

// Zoom
var zd, m;
m = (1 - 0.25 * mouse_wheel * (window_scroll_focus_prev = "uveditor"))
if (m != 1)
{
	uv_editor_goal_zoom = clamp(uv_editor_goal_zoom * m, 0.1, 100)
	
	uv_editor_goal_x = uv_editor_x + (mouse_x - (boxx + boxw / 2)) / uv_editor_zoom - (mouse_x - (boxx + boxw / 2)) / uv_editor_goal_zoom
	uv_editor_goal_y = uv_editor_y + (mouse_y - (boxy + boxh / 2)) / uv_editor_zoom - (mouse_y - (boxy + boxh / 2)) / uv_editor_goal_zoom
}
zd = (uv_editor_goal_zoom - uv_editor_zoom) / max(1, 5 / delta)
if (zd != 0 || (uv_editor_goal_x != uv_editor_x) || (uv_editor_goal_y != uv_editor_y))
{
	if (setting_reduced_motion)
	{
		uv_editor_zoom = uv_editor_goal_zoom
		uv_editor_x = uv_editor_goal_x
		uv_editor_y = uv_editor_goal_y
	}
	else
	{
		uv_editor_zoom += zd
		uv_editor_x += (uv_editor_goal_x - uv_editor_x) / max(1, 5 / delta)
		uv_editor_y += (uv_editor_goal_y - uv_editor_y) / max(1, 5 / delta)
	}
}

uv_editor_update_zoom = false

if (uv_editor_mouseon)
	window_scroll_focus = "uveditor"

// Draw UV editor

// Draw tiled 'transprent' background
draw_box(boxx, boxy, boxw, boxh, false, c_background, 1)

for (var i = 0; i < ceil(boxw/192); i++)
	for (var j = 0; j < ceil(boxh/192); j++)
		draw_image(spr_uv_editor_pattern, 0, boxx + (i * 192), boxy + (j * 192), 1, 1, c_text_main, .05)

// Texture
var tex, texscale;
tex = null
texscale = 1

if (el_edit = null)
{
	if (app.res = null)
		tex = spr_empty
	else
	{
		tex = app.res.sprite
		texscale = app.res.scale
	}
}
else
{
	if (el_edit.res = null)
		tex = spr_empty
	else
	{
		tex = el_edit.res.sprite
		texscale = el_edit.res.scale
	}
}

if (tex != null)
{
	var padding, tw, th;
	padding = 64
	tw = texture_width(tex)
	th = texture_height(tex)
	
	if (uv_editor_tex != tex || uv_editor_reset)
	{
		if (uv_editor_tex = null || uv_editor_reset)
		{
			uv_editor_goal_x = 0
			uv_editor_goal_y = 0
			
			uv_editor_goal_zoom = (min(boxw, boxh) - padding * 2) / max(tw, th)
			
			if (uv_editor_reset)
				uv_editor_update_zoom = true
		}
		
		uv_editor_tex = tex
	}
	
	// Clear reset
	if (uv_editor_reset)
		uv_editor_reset = false
	
	texx = floor(boxx + (boxw / 2 - (tw / 2 + uv_editor_x) * uv_editor_zoom))
	texy = floor(boxy + (boxh / 2 - (th / 2 + uv_editor_y) * uv_editor_zoom))
	texw = floor(tw * uv_editor_zoom)
	texh = floor(th * uv_editor_zoom)
	
	draw_texture(uv_editor_tex, texx, texy, uv_editor_zoom, uv_editor_zoom)
	
	// Repeat texture
	var maxrepeat = max(ceil(boxh/texh), ceil(boxw/texw));
	if (maxrepeat < 15)
	{
		var yrepeat, xrepeatstart, xrepeat;
		yrepeat = (texy - boxy) - (ceil((texy - boxy)/texh) * texh)
		xrepeatstart = (texx - boxx) - (ceil((texx - boxx)/texw) * texw)
		xrepeat = xrepeatstart
	
		for (var i = 0; i <= ceil(boxh/texh); i++)
		{
			xrepeat = xrepeatstart
			
			for (var j = 0; j <= ceil(boxw/texw); j++)
			{
				var alpha = 0.125
				
				if (xrepeat = texx || yrepeat = texy)
					alpha = 0.25
				
				if (xrepeat = texx && yrepeat = texy)
				{
					xrepeat += texw
					continue
				}
				
				draw_texture(uv_editor_tex, boxx + xrepeat, boxy + yrepeat, uv_editor_zoom, uv_editor_zoom, c_white, alpha * percent(maxrepeat, 15, 10))
				xrepeat += texw
			}
			
			yrepeat += texh
		}
	}
}

// Texture outline
draw_line_ext(texx, boxy, texx, boxy + boxh, c_border, a_border)
draw_line_ext(texx + texw - 1, boxy, texx + texw - 1, boxy + boxh, c_border, a_border)

draw_line_ext(boxx, texy, boxx + boxw, texy, c_border, a_border)
draw_line_ext(boxx, texy + texh - 1, boxx + boxw, texy + texh - 1, c_border, a_border)

// Pixel outline(zoom required multiplied by texscale for bigger textures)
var snapval = (setting_snap ? max(setting_snap_size_uv, .125) : 1);
if (uv_editor_zoom * texscale > 5)
{
	var alpha = percent(uv_editor_zoom * texscale, 5, 7);
	
	// Highlight pixels seperately if snap value is not 1
	if (snapval != 1)
	{
		for (var i = texscale; i < texture_width(uv_editor_tex); i += texscale)
		{
			if (texx + floor(i * uv_editor_zoom) > boxx && texx + floor(i * uv_editor_zoom) < boxx + boxw)
				draw_line_ext(texx + floor(i * uv_editor_zoom), texy, texx + floor(i * uv_editor_zoom), texy + texh, c_border, 0.2 * alpha)
		}
	
		for (var i = texscale; i < texture_height(uv_editor_tex); i += texscale)
		{
			if (texy + floor(i * uv_editor_zoom) > boxy && texy + floor(i * uv_editor_zoom) < boxy + boxh)
				draw_line_ext(texx, texy + floor(i * uv_editor_zoom), texx + texw, texy + floor(i * uv_editor_zoom), c_border, 0.2 * alpha)
		}
	}
	
	for (var i = (texscale * snapval); i < texture_width(uv_editor_tex); i += (texscale * snapval))
	{
		if (texx + floor(i * uv_editor_zoom) > boxx && texx + floor(i * uv_editor_zoom) < boxx + boxw)
			draw_line_ext(texx + floor(i * uv_editor_zoom), texy, texx + floor(i * uv_editor_zoom), texy + texh, c_border, 0.075 * alpha)
	}
	
	for (var i = (texscale * snapval); i < texture_height(uv_editor_tex); i += (texscale * snapval))
	{
		if (texy + floor(i * uv_editor_zoom) > boxy && texy + floor(i * uv_editor_zoom) < boxy + boxh)
			draw_line_ext(texx, texy + floor(i * uv_editor_zoom), texx + texw, texy + floor(i * uv_editor_zoom), c_border, 0.075 * alpha)
	}
}

// Text
draw_label("[ 0, 0 ]", texx - 8, texy - 8, fa_right, fa_bottom, c_text_main, a_text_main, font_emphasis)
draw_label("[ " + string(texture_width(uv_editor_tex)) + ", 0 ]", texx + texw + 8, texy - 8, fa_left, fa_bottom, c_text_main, a_text_main, font_emphasis)
draw_label("[ 0, " + string(texture_height(uv_editor_tex)) + " ]", texx - 8, texy + texh + 8, fa_right, fa_top, c_text_main, a_text_main, font_emphasis)
draw_label("[ " + string(texture_width(uv_editor_tex)) + ", " + string(texture_height(uv_editor_tex)) + " ]", texx + texw + 8, texy + texh + 8, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)

var overlaytexscale, shapeuv, shapesize, shapeuvnozoom, shapesizenozoom;

render_set_culling(false)

// Shape overlay
with (obj_model_element)
{
	// Not valid for rendering overlay
	if (element_type = TYPE_PART || res = null || res.sprite != other.uv_editor_tex || id = el_edit)
		continue
		
	// Only display selected shapes if shared texture UVs is disabled
	if (!app.setting_shared_texture_uvs)
		if (!selected)
			continue
	
	overlaytexscale = res.scale
	shapeuv = vec2_mul(vec2_mul(uv, overlaytexscale), other.uv_editor_zoom)
	shapesize = vec3_mul(vec3_mul(point3D_sub(to_noscale, from_noscale), overlaytexscale), other.uv_editor_zoom)

	if (type = "block")
	{
		draw_box(texx + (shapeuv[X] - shapesize[Y]), texy + shapeuv[Y], shapesize[Y] + shapesize[X] + shapesize[Y] + shapesize[X], shapesize[Z], false, c_accent, .35)
		draw_box(texx + shapeuv[X], texy + shapeuv[Y] - shapesize[Y], shapesize[X] * 2, shapesize[Y], false, c_accent, .35)
	}
	else
		draw_box(texx + shapeuv[X], texy + shapeuv[Y], shapesize[X], shapesize[Z], false, c_accent, .35)
}

// Stop drawing if we aren't editing any shapes
if (el_edit = null || el_edit.element_type = TYPE_PART)
{
	uv_editor_mouseon = content_mouseon
	
	if (uv_editor_mouseon)
		mouse_cursor = cr_size_all
	
	render_set_culling(true)
	
	return 0
}

shapeuv = vec2_mul(vec2_mul(el_edit.uv, texscale), uv_editor_zoom)
shapesize = vec3_mul(vec3_mul(point3D_sub(el_edit.to_noscale, el_edit.from_noscale), texscale), uv_editor_zoom)
shapeuvnozoom = el_edit.uv
shapesizenozoom = point3D_sub(el_edit.to_noscale, el_edit.from_noscale)

// Shape edit overlay
if (el_edit.type = "block")
{
	draw_box(texx + (shapeuv[X] - shapesize[Y]), texy + shapeuv[Y], shapesize[Y] + shapesize[X] + shapesize[Y] + shapesize[X], shapesize[Z], false, c_accent, .5)
	draw_box(texx + shapeuv[X], texy + shapeuv[Y] - shapesize[Y], shapesize[X] * 2, shapesize[Y], false, c_accent, .5)
}
else
	draw_box(texx + shapeuv[X], texy + shapeuv[Y], shapesize[X], shapesize[Z], false, c_accent, .5)

// Face outlines and labels
var righttext, lefttext;
righttext = (el_edit.value[e_value.TEX_MIRROR] ? "uveditorleft" : "uveditorright")
lefttext = (el_edit.value[e_value.TEX_MIRROR] ? "uveditorright" : "uveditorleft")

draw_set_font(font_heading)
draw_set_color(c_background)
draw_set_valign(fa_center)
draw_set_halign(fa_middle)

// Front
draw_outline(texx + shapeuv[X], texy + shapeuv[Y], shapesize[X], shapesize[Z], 1, c_accent_hover, 1, true)
if (string_width(text_get("uveditorfront")) < abs(shapesize[X]) && string_height(text_get("uveditorfront")) < abs(shapesize[Z]))
	draw_label(text_get("uveditorfront"), texx + shapeuv[X] + shapesize[X]/2, texy + shapeuv[Y] + shapesize[Z]/2)

if (el_edit.type = "block")
{
	// Left
	draw_outline(texx + shapeuv[X] + shapesize[X], texy + shapeuv[Y], shapesize[Y], shapesize[Z], 1, c_accent_hover, 1, true)
	if (string_width(text_get(lefttext)) < abs(shapesize[Y]) && string_height(text_get(lefttext)) < abs(shapesize[Z]))
		draw_label(text_get(lefttext), texx + shapeuv[X] + shapesize[X] + shapesize[Y]/2, texy + shapeuv[Y] + shapesize[Z]/2)

	// Back
	draw_outline(texx + shapeuv[X] + shapesize[X] + shapesize[Y], texy + shapeuv[Y], shapesize[X], shapesize[Z], 1, c_accent_hover, 1, true)
	if (string_width(text_get("uveditorback")) < abs(shapesize[X]) && string_height(text_get("uveditorback")) < abs(shapesize[Z]))
		draw_label(text_get("uveditorback"), texx + shapeuv[X] + shapesize[X] + shapesize[Y] + shapesize[X]/2, texy + shapeuv[Y] + shapesize[Z]/2)

	// Right
	draw_outline(texx + shapeuv[X] - shapesize[Y], texy + shapeuv[Y], shapesize[Y], shapesize[Z], 1, c_accent_hover, 1, true)
	if (string_width(text_get(righttext)) < abs(shapesize[Y]) && string_height(text_get(righttext)) < abs(shapesize[Z]))
		draw_label(text_get(righttext), texx + shapeuv[X] - shapesize[Y] + shapesize[Y]/2, texy + shapeuv[Y] + shapesize[Z]/2)

	// Top
	draw_outline(texx + shapeuv[X], texy + shapeuv[Y] - shapesize[Y], shapesize[X], shapesize[Y], 1, c_accent_hover, 1, true)
	if (string_width(text_get("uveditortop")) < abs(shapesize[X]) && string_height(text_get("uveditortop")) < abs(shapesize[Y]))
		draw_label(text_get("uveditortop"), texx + shapeuv[X] + shapesize[X]/2, texy + shapeuv[Y] - shapesize[Y] + shapesize[Y]/2)

	// Bottom
	draw_outline(texx + shapeuv[X] + shapesize[X], texy + shapeuv[Y] - shapesize[Y], shapesize[X], shapesize[Y], 1, c_accent_hover, 1, true)
	if (string_width(text_get("uveditorbottom")) < abs(shapesize[X]) && string_height(text_get("uveditorbottom")) < abs(shapesize[Y]))
		draw_label(text_get("uveditorbottom"), texx + shapeuv[X] + shapesize[X] + shapesize[X]/2, texy + shapeuv[Y] - shapesize[Y] + shapesize[Y]/2)
}

draw_set_color(c_white)
render_set_culling(true)

// Draw controllers

// X/Y controller
draw_box(texx + shapeuv[X] - 7, texy + shapeuv[Y] - 7, 12, 12, false, (window_busy = "uveditorcontrolxy" ? c_background : c_accent_hover), 1)
draw_box(texx + shapeuv[X] - 5, texy + shapeuv[Y] - 5, 8, 8, false, c_accent_pressed, 1)
if (app_mouse_box(texx + shapeuv[X] - 7, texy + shapeuv[Y] - 7, 12, 12))
{
	if (mouse_left_pressed)
	{
		window_busy = "uveditorcontrolxy"
		window_focus = "uveditor"
		uv_editor_edit_x = shapeuvnozoom[X]
		uv_editor_edit_y = shapeuvnozoom[Y]
	}
	
	uv_editor_xy_mouseon = true
	mouse_cursor = cr_handpoint
}
else
	uv_editor_xy_mouseon = false

// Width/Height controller
draw_box(texx + shapeuv[X] + shapesize[X] - 7, texy + shapeuv[Y] + shapesize[Z] - 7, 12, 12, false, (window_busy = "uveditorcontrolwh" ? c_background : c_accent_hover), 1)
draw_box(texx + shapeuv[X] + shapesize[X] - 5, texy + shapeuv[Y] + shapesize[Z] - 5, 8, 8, false, c_accent_pressed, 1)
if (app_mouse_box(texx + shapeuv[X] + shapesize[X] - 7, texy + shapeuv[Y] + shapesize[Z] - 7, 12, 12))
{
	if (mouse_left_pressed)
	{
		window_busy = "uveditorcontrolwh"
		window_focus = "uveditor"
		uv_editor_edit_x = shapeuvnozoom[X] + shapesizenozoom[X]
		uv_editor_edit_y = shapeuvnozoom[Y] + shapesizenozoom[Z]
	}
	
	uv_editor_wh_mouseon = true
	mouse_cursor = cr_size_nwse
}
else
	uv_editor_wh_mouseon = false

// Length controller
if (el_edit.type = "block")
{
	draw_box(texx + shapeuv[X] - shapesize[Y] - 7, texy + shapeuv[Y] - 7, 12, 12, false, (window_busy = "uveditorcontrollength" ? c_background : c_accent_hover), 1)
	draw_box(texx + shapeuv[X] - shapesize[Y] - 5, texy + shapeuv[Y] - 5, 8, 8, false, c_accent_pressed, 1)
	if (app_mouse_box(texx + shapeuv[X] - shapesize[Y] - 7, texy + shapeuv[Y] - 7, 12, 12))
	{
		if (mouse_left_pressed)
		{
			window_busy = "uveditorcontrollength"
			window_focus = "uveditor"
			uv_editor_edit_x = shapeuvnozoom[X] - shapesizenozoom[Y]
		}
	
		uv_editor_length_mouseon = true
		mouse_cursor = cr_size_we
	}
	else
		uv_editor_length_mouseon = false
}

var mouseuvx, mouseuvy;
mouseuvx = snap((mouse_x - texx) / uv_editor_zoom / texscale, setting_snap ? setting_snap_size_uv : 1)
mouseuvy = snap((mouse_y - texy) / uv_editor_zoom / texscale, setting_snap ? setting_snap_size_uv : 1)

// Box UV controls
if (keyboard_check(vk_control))
{
	if (window_busy != "uveditorcontrolbox" && content_mouseon)
	{
		draw_box(texx + (mouseuvx * uv_editor_zoom * texscale) - 7, texy + (mouseuvy * uv_editor_zoom * texscale) - 7, 12, 12, false, c_accent_hover, 1)
		draw_box(texx + (mouseuvx * uv_editor_zoom * texscale) - 5, texy + (mouseuvy * uv_editor_zoom * texscale) - 5, 8, 8, false, c_accent_pressed, 1)
	}
	
	mouse_cursor = cr_default
	
	if (mouse_left_pressed && (content_mouseon || window_busy = "uveditorcontrolbox"))
	{
		window_busy = "uveditorcontrolbox"
		window_focus = "uveditor"
		uv_editor_edit_x = mouseuvx
		uv_editor_edit_y = mouseuvy
	}
}

// Update element UV/shape size
if (window_busy = "uveditorcontrolxy")
{
	mouse_cursor = cr_handpoint
	if (mouse_still = 0)
	{
		action_el_uv_xy(mouseuvx - uv_editor_edit_x, mouseuvy - uv_editor_edit_y, true)
	
		uv_editor_edit_x = mouseuvx
		uv_editor_edit_y = mouseuvy
	}
}

if (window_busy = "uveditorcontrolwh")
{
	mouse_cursor = cr_size_nwse
	if (mouse_still = 0)
	{
		action_el_uv_width_height(mouseuvx - uv_editor_edit_x, mouseuvy - uv_editor_edit_y, true)
		
		uv_editor_edit_x = mouseuvx
		uv_editor_edit_y = mouseuvy
	}
}

if (window_busy = "uveditorcontrollength")
{
	mouse_cursor = cr_size_we
	if (mouse_still = 0)
	{
		action_el_uv_length(uv_editor_edit_x - mouseuvx, true)
		
		uv_editor_edit_x = mouseuvx
	}
}

if (window_busy = "uveditorcontrolbox")
{
	mouse_cursor = cr_default
	if (mouse_still = 0 && mouse_left)
		action_el_uv_size(point2D(uv_editor_edit_x, uv_editor_edit_y), point3D(mouseuvx - uv_editor_edit_x, mouseuvx - uv_editor_edit_x, mouseuvy - uv_editor_edit_y), false)
}

uv_editor_mouseon = content_mouseon && !(uv_editor_xy_mouseon || uv_editor_wh_mouseon || uv_editor_length_mouseon || keyboard_check(vk_control))

if (uv_editor_mouseon)
	mouse_cursor = cr_size_all

// Clear UV editor controls
if (window_busy = "uveditorcontrolxy" || window_busy = "uveditorcontrolwh" || window_busy = "uveditorcontrollength")
{
	if (!mouse_left)
	{
		window_busy = ""
		app_mouse_clear()
	}
}

if (window_busy = "uveditorcontrolbox")
{
	if (!keyboard_check(vk_control))
		window_busy = ""
}
