/// app_startup_recent()

enum e_recent_sort {
	filename_ascend,
	filename_descend,
	date_ascend,
	date_descend
}

recent_display_mode = "list"
recent_sort_mode = e_recent_sort.date_descend

recent_list = ds_list_create()
recent_list_display = ds_list_create()

recent_list_amount = 0
recent_list_update = false

recent_splash_x = 0
recent_splash_y = 0
recent_splash_goal_x = recent_splash_x
recent_splash_goal_y = recent_splash_y

recent_load()
