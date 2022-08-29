/// snackbar_previous_tip(snackbar)
/// @arg snackbar

function snackbar_previous_tip(sb)
{
	sb.tip--
	sb.tip = mod_fix(sb.tip, 5)
	
	sb.description = ("snackbartip" + string(sb.tip + 1))
}
