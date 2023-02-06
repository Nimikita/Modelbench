/// toast_recover_model()

function toast_recover_model()
{
	var sb = toast_new(e_toast.INFO, text_get("startupmodeldetected"));//, "startupmodeldetecteddesc");
	sb.actions[|0] = "startuprecovermodel"
	sb.actions[|1] = model_recover
	
	return sb
}
