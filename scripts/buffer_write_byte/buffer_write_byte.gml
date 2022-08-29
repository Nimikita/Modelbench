/// buffer_write_byte(value)
/// @arg value
/// @desc Writes a byte to the buffer

function buffer_write_byte(value)
{
	buffer_write(buffer_current, buffer_u8, value)
}