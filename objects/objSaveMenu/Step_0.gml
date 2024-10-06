sv_left_key = input_check_pressed("left");
sv_right_key = input_check_pressed("right");
sv_confirm_key = input_check_pressed("confirm");

if (sv_left_key || sv_right_key) && !saved 
{
	audio_play_sound(sndMenuMove, 1, false);
}

if sv_confirm_key 
{
	audio_play_sound(sndSelect, 1, false);
}

if sv_confirm_key && saved
{
	instance_destroy();
}

if !saved
{
	sv_pos += sv_right_key - sv_left_key;
}

if sv_pos >= sv_op_length {sv_pos = 0};
if sv_pos < 0 {sv_pos = sv_op_length - 1};

if sv_confirm_key && !saved
{
	switch(sv_pos)
	{

		case 0 :
		SAVE();
		saved = true;
		break;
	
		case 1 :
		instance_destroy();
		break;


	}
}

