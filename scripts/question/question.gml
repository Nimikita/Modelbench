/// question(text)
/// @arg text

function question(text)
{
	window_set_caption("Modelbench")
	answer = show_question(text)
	window_set_caption("")
	
	return answer
}
