/// snackbar_tip()

var sb;
sb = new_snackbar(icons.TIP, "snackbartipcaption", "", e_snackbar.DEFAULT)
sb.tip = irandom_range(0, 4)

sb.description = ("snackbartip" + string(sb.tip + 1))

sb.snackbar_action1_name = "snackbartipprevious"
sb.snackbar_action1 = snackbar_previous_tip
sb.snackbar_action1_value = sb

sb.snackbar_action2_name = "snackbartipnext"
sb.snackbar_action2 = snackbar_next_tip
sb.snackbar_action2_value = sb

return sb
