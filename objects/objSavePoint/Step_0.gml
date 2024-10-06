if place_meeting(x, y, objPlayerInteractionBox) && !instance_exists(objSaveMenu) && !instance_exists(objGameMenu)
{

	if text_id != ""
	{
		create_textbox(text_id);
	}
	
	if global.Player.HP < global.Player.MaxHP
	{
		global.Player.HP = global.Player.MaxHP;
		audio_play_sound(sndHeal, 10, false);
	}
	instance_create_depth(x, y, -16000, objSaveMenu);

}