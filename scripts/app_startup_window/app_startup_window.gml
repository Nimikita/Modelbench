/// app_startup_window()

globalvar current_step, delta, step_event_time, step_event_time_start, draw_event_time, draw_event_time_start;
current_step = 0
delta = 1
step_event_time = 0
step_event_time_start = 0
draw_event_time = 0
draw_event_time_start = 0

log("Windows startup")

http_snackbar_news = null

window_width = 1
window_height = 1
window_set_focus()
window_set_min_width(100)
window_set_min_height(100)
window_set_caption("Modelbench")

window_state = "startup"
window_busy = ""
window_focus = ""
window_scroll_focus = ""
window_scroll_focus_prev = ""
window_in_focus = window_has_focus()

mouse_cursor = cr_default
mouse_current_x = 0
mouse_current_y = 0
mouse_previous_x = 0
mouse_previous_y = 0
mouse_move = 0
mouse_move_right = 0
mouse_still = 0
mouse_wrap_x = 0
mouse_wrap_y = 0
mouse_click_timer = 0
mouse_click_count = 0
app_mouse_clear()

dragger_drag_value = 0
meter_drag_value = 0
wheel_drag_value = 0

dragger_multiplier = 1
dragger_snap = false

content_x = 0
content_y = 0
content_width = 0
content_height = 0
content_mouseon = false
content_tab = null
content_direction = null
content_view = null

dx = 0
dy = 0
dw = 0
dh = 0
dx_start = 0
dy_start = 0
dw_start = 0
dh_start = 0
tab = null
tab_control_h = 0
tab_collapse = false

// Tips
tip_show = false
tip_alpha = 0
tip_text = ""
tip_text_wrap = ""
tip_x = 0
tip_y = 0
tip_w = 0
tip_h = 0
tip_box_x = 0
tip_box_y = 0
tip_location_x = 0
tip_location_y = 0
tip_wrap = true
tip_shortcut_shortcut = -1
tip_shortcut_draw = false
tip_arrow_x = 0
tip_arrow_y = 0
tip_arrow_yscale = 1
tip_text_array = 0
tip_force_right = false
tip_right = false
//tip_force_left = false
//tip_left = false

// Popups
popup = null
popup_ani = 0
popup_ani_type = ""
popup_switch_to = null
popup_switch_from = null
popup_mouseon = false
