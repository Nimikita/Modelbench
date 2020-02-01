/// snackbar_next_tip(snackbar)
/// @arg snackbar

var sb = argument0;
sb.tip++
sb.tip = mod_fix(sb.tip, 5)

sb.description = ("snackbartip" + string(sb.tip + 1))
