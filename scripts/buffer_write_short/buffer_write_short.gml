/// buffer_write_short(value)
/// @arg value
/// @desc Writes a short integer to the buffer

function buffer_write_short(value)
{
	buffer_write(buffer_current, buffer_u16, value)
}