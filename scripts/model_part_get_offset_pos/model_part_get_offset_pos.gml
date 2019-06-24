/// model_part_get_offset_pos([part], [offset])
/// @arg [part
/// @arg [offset]]

var part, offset, bendpart, bendoffset;
part = id

if (argument_count > 0)
	part = argument[0]

if (argument_count > 1)
	offset = argument[1]
else
	offset = part.value[e_value.BEND_OFFSET]

bendpart = part.value[e_value.BEND_PART]
bendoffset = offset

switch (bendpart)
{
	case e_part.RIGHT:	return point3D(bendoffset, 0, 0); break
	case e_part.LEFT:	return point3D(bendoffset, 0, 0); break
	case e_part.FRONT:	return point3D(0, bendoffset, 0); break
	case e_part.BACK:	return point3D(0, bendoffset, 0); break
	case e_part.UPPER:	return point3D(0, 0, bendoffset); break
	case e_part.LOWER:	return point3D(0, 0, bendoffset); break
	default: return point3D(0, 0, 0); break;
}
