if global.Player.InvFrames == 0
{
	audio_play_sound(sndHurt, 1, false);
	global.Player.InvFrames = global.Player.MaxInvFrames;
	damage = 5;
	global.Player.HP -= damage;
}
instance_destroy();
if global.Player.HP <= 0 
{
	room_goto(rmGameOver);
	SetSongIngame(noone, 0, 0);
}
