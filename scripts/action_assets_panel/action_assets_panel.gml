/// action_assets_panel()

function action_assets_panel()
{
	if (assets.show)
		tab_close(assets)
	else
		tab_show(assets)
}
