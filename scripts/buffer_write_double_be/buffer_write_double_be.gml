/// buffer_write_double_be(value)
/// @arg value
/// @desc Writes a big endian float to the buffer

function buffer_write_double_be(argument0)
{
	var tmpbuf, byte;
	tmpbuf = buffer_create(8, buffer_fixed, 1)
	buffer_write(tmpbuf, buffer_f64, argument0)
	buffer_seek(tmpbuf, 0, 0)
	
	for (var b = 0; b < 8; b++)
		byte[b] = buffer_read(tmpbuf, buffer_s8)
	buffer_delete(tmpbuf)
	
	for (var b = 0; b < 8; b++)
		buffer_write_byte(byte[7 - b])
}