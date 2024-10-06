var _s = id;


if place_meeting(x, y, objPlayerInteractionBox) && !instance_exists(objTextbox) && !instance_exists(objGameMenu)
{
create_textbox(text_id[interaction_count]);
interacted = true;
	if interaction_count < array_length(text_id) - 1
	{
	interaction_count += 1;
	}
}

