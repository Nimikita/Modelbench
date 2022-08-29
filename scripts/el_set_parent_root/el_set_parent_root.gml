/// el_set_parent_root()

function el_set_parent_root()
{
	el_set_parent(((el_edit = null || el_edit.element_type != TYPE_PART) ? app : el_edit))
}
