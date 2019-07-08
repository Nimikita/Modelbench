/// toolbar_draw()

var boxx, boxy, boxw, boxh;
boxx = 0
boxy = 0
boxw = window_width
boxh = 36
content_direction = e_scroll.HORIZONTAL

content_x = boxx
content_y = boxy
content_width = boxw
content_height = boxh

draw_box(content_x, content_y, content_width, content_height, false, c_background, 1)
draw_gradient(content_x, content_y + content_height, content_width, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)

draw_menu_button(boxx + 4, boxy, boxh, boxh)
