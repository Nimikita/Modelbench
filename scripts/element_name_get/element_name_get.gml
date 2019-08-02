/// element_name_get([id])
/// @arg [id]
/// @desc Returns proper display name if name is empty

var elementid;
elementid = id

if (argument_count > 0)
	elementid = argument0
	
if (elementid.name = "")
{
	if (elementid.element_type = TYPE_PART)
		return text_get("assetsnewpart")
	else
		return text_get("assetsnewshape")
}
else
	return elementid.name
