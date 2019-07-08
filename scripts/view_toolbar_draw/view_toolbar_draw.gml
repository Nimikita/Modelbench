/// view_toolbar_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

var xx, yy, width, height;
xx = argument0
yy = argument1
width = argument2
height = argument3

// Background
draw_box(xx, yy, width, height, false, c_background, 1)
draw_dropshadow(xx, yy, width, height, c_black, 1)

yy += 4
xx += 4

// Add block
draw_button_icon("toolbaraddblock", xx, yy, 28, 28, false, e_icon.block_add, null, true)
yy += 28 + 4

// Add plane
draw_button_icon("toolbaraddplane", xx, yy, 28, 28, false, e_icon.plane_add, null, true)
yy += 28 + 4

// Add plane (3d)
draw_button_icon("toolbaraddplane3d", xx, yy, 28, 28, false, e_icon.plane3d_add, null, true)
yy += 28 + 4

draw_box(xx, yy, 28, 1, false, c_neutral10, a_neutral10)
yy += 4

// Select-only tool
draw_button_icon("toolbarselect", xx, yy, 28, 28, false, e_icon.cursor, null, true)
yy += 28 + 4

// Position tool
draw_button_icon("toolbarpositiontool", xx, yy, 28, 28, false, e_icon.toolset_position, null, true)
yy += 28 + 4

// Rotate tool
draw_button_icon("toolbarrotatetool", xx, yy, 28, 28, false, e_icon.toolset_rotate, null, true)
yy += 28 + 4

// Scale tool
draw_button_icon("toolbarscaletool", xx, yy, 28, 28, false, e_icon.toolset_scale, null, true)
yy += 28 + 4
