/// point3D_mul_matrix(point, matrix)
/// @arg point
/// @arg matrix

function point3D_mul_matrix(pnt, mat)
{
	return matrix_transform_vertex(mat, pnt[@ X], pnt[@ Y], pnt[@ Z])
}
