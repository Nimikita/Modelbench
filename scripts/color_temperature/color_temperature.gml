/// color_temperature(kelvin)
/// @arg kelvin
/// @desc http://www.tannerhelland.com/4435/convert-temperature-rgb-algorithm-code/

function color_temperature(kelvin)
{
	var colorrgb, channelcalc;
	colorrgb = array_create(3, 0)
	
	// Clamp and divide by 100
	kelvin = clamp(kelvin, 1000, 40000)
	kelvin /= 100
	
	// Red
	if (kelvin > 66)
	{
		channelcalc = kelvin - 60
		channelcalc = 329.698727446 * power(channelcalc, -0.1332047592)
		colorrgb[0] = clamp(channelcalc, 0, 255)
	}
	else
		colorrgb[0] = 255
	
	// Green
	if (kelvin <= 66)
	{
		channelcalc = kelvin
		channelcalc = 99.4708025861 * ln(channelcalc) - 161.1195681661
		colorrgb[1] = clamp(channelcalc, 0, 255)
	}
	else
	{
		channelcalc = kelvin - 60
		channelcalc = 288.1221695283 * power(channelcalc, -0.0755148492)
		colorrgb[1] = clamp(channelcalc, 0, 255)
	}
	
	// Blue
	if (kelvin >= 66)
		colorrgb[2] = 255
	else if (kelvin <= 19)
		colorrgb[2] = 0
	else
	{
		channelcalc = kelvin - 10
		channelcalc = 138.5177312231 * ln(channelcalc) - 305.0447927307
		colorrgb[2] = clamp(channelcalc, 0, 255)
	}
	
	return make_color_rgb(colorrgb[0], colorrgb[1], colorrgb[2])
}
