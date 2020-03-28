/// app_update_count()

model_shapes = 0
model_planes = 0
model_planes3d = 0
model_blocks = 0
model_parts = 0
model_elements = 0

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE)
	{
		app.model_shapes++
			
		if (type = "plane")
		{
			if (value[e_value.EXTRUDE])
				app.model_planes3d++
			else
				app.model_planes++
		}	
		else if (type = "block")
			app.model_blocks++
	}
	else
		app.model_parts++
	
	app.model_elements++
}
