/// shortcut_bar_add(shortcut, mouse, text)
/// @arg shortcut
/// @arg mouse
/// @arg text

function shortcut_bar_add(shortcut, mouse, text)
{
	ds_list_add(app.shortcut_bar_list, [shortcut, mouse, text_get("shortcut" + text)])
}
