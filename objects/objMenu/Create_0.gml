op_pos = 0;

switch(menu_type)
{
	case 0:
	break;
	
	case 1: 
	if instance_exists(objPlayer)
	{
		objPlayer.can_move = false;
	}
	audio_play_sound(sndMenuMove, 1, false);
	break;
}
