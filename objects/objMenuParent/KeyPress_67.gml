vx = camera_get_view_border_x(view_camera[0]);
vy = camera_get_view_border_y(view_camera[0]);

if !instance_exists(objGameMenu) && !instance_exists(objTextbox) && objPlayer.can_move == true 
{
    instance_create_depth(vx + 44, vy + 138, -16000, objGameMenu);
	audio_play_sound(sndMenuMove, 1, false);
}
else
{

}