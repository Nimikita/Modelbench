/// buffer_write_double(value)
/// @arg value
/// @desc Writes a double to the buffer

function buffer_write_double(value)
{
	buffer_write(buffer_current, buffer_f64, value)
}