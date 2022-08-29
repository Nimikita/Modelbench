/// popup_switch(popup)
/// @arg popup

function popup_switch(argument0)
{
	popup_switch_to = argument0
	popup_switch_from = popup
	window_busy = "popup" + popup_switch_to.name
	popup_ani_type = "hide"
}
