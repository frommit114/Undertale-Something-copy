if !instance_exists(objTextbox) && !instance_exists(objGameMenu)
{
create_textbox(text_id[npc_interaction_count]);
npc_interacted = true;
	if npc_interaction_count < array_length(text_id) - 1
	{
	npc_interaction_count += 1;
	}
}
