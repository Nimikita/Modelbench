/// app_startup_interface_snackbar()

snackbar_list = ds_list_create()
snackbar_amount = 0

snackbar_script = null
snackbar_script_value = null
snackbar_mouseon = false

http_snackbar_news = http_get(link_news)
