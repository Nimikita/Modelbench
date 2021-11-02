/// app_update_highlight()

if (assets.elements.element_hover != assets.elements.element_hover_prev)
	el_update_parent_hover()

assets.elements.element_hover_prev = assets.elements.element_hover
assets.elements.element_hover = null
