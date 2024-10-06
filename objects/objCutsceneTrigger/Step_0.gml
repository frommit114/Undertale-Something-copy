if !instance_exists(objCutscene)
{
	if(place_meeting(x, y, objPlayer))
	{
		CreateCutscene(t_scene_info);
		instance_destroy();
	}
}
