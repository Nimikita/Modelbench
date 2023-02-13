/// app_event_http()

function app_event_http()
{
	if (async_load[?"id"] = http_toast_news && async_load[?"status"] < 1)
	{
		http_toast_news = null
		if (async_load[?"status"] = 0 && async_load[?"http_status"] = http_ok)
		{
			log(async_load[?"result"])
			
			var decodedmap = json_decode(async_load[?"result"]);
			if (ds_map_valid(decodedmap))
			{
				var newslist = decodedmap[?"default"];
				for (var n = 0; n < ds_list_size(newslist); n++)
				{
					var newsmap, name, text, button, buttonurl;
					newsmap = newslist[|n]
					
					if (ds_map_valid(newsmap))
					{
						name = newsmap[?"title"]
						text = newsmap[?"text"]
						
						button = newsmap[?"button"]
						buttonurl = newsmap[?"buttonurl"]
						
						var sb = toast_news();
						sb.text = text
						
						sb.actions[|0] = "snackbarbuttondownload"
						sb.actions[|1] = open_url
						sb.actions[|2] = buttonurl
						sb.dismiss_time = no_limit
					}
				}
				ds_map_destroy(decodedmap)
			}
			else
				log("Failed to decode")
		}
	}
}
