switch(objPlayerInteractionBox.dir)
{
	case 0 :
	current_sprite = spr_left;
	break;
	
	case 1  :
	current_sprite = spr_down;
	break;
	
	case 2 :
	current_sprite = spr_right;
	break;
	
	case 3:
	current_sprite = spr_up;
	break;
}

image_speed = 1;

if !instance_exists(objTextbox) && !instance_exists(objGameMenu)
{
	create_textbox(text_id[npc_interaction_count], 1);
	npc_interacted = true;
	if npc_interaction_count < array_length(text_id) - 1
	{
		npc_interaction_count ++;
	}
}
