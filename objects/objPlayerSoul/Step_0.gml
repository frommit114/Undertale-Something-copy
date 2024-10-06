//Inputs
soul_up_key = input_check("up");
soul_down_key = input_check("down");
soul_right_key = input_check("right");
soul_left_key = input_check("left");

soul_xspd = (soul_right_key - soul_left_key) * soul_move_spd;
soul_yspd = (soul_down_key - soul_up_key) * soul_move_spd;

x += soul_xspd;
y += soul_yspd;

if (global.Player.InvFrames > 0) 
{
	global.Player.InvFrames -= 1;
	image_speed = 1;
}
else 
{
	image_speed = 0;
	image_index = 0;
}