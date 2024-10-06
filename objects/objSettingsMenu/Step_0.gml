//inputs
st_up_key = input_check_pressed("up");
st_down_key = input_check_pressed("down");
st_right_key = input_check_pressed("right");
st_left_key = input_check_pressed("left");
st_confirm_key = input_check_pressed("confirm");
st_back_key = input_check_pressed("cancel");

//sounds
if (st_up_key || st_down_key) && st_selected_op == false
{
	audio_play_sound(sndMenuMove, 8, false);
}
if st_confirm_key && st_selected_op == false && st_pos != 6
{
	audio_play_sound(sndSelect, 8, false);
}

//menu movement
if st_selected_op != true
{
	st_pos += st_down_key - st_up_key;
}
if st_pos >= st_op_length {st_pos = 0};
if st_pos < 0 {st_pos = st_op_length - 1};

//Sound
if st_selected_op == true
{
	if st_selected_audio_group == audiogroup_sfx
	{
		if st_right_key { global.sfx_volume += 0.01; audio_group_set_gain(st_selected_audio_group, global.sfx_volume, 0); }
		if st_left_key { global.sfx_volume -= 0.01; audio_group_set_gain(st_selected_audio_group, global.sfx_volume, 0); }
		if st_right_key && keyboard_check(vk_shift) { global.sfx_volume += 0.05; audio_group_set_gain(st_selected_audio_group, global.sfx_volume, 0); }
		if st_left_key && keyboard_check(vk_shift) { global.sfx_volume -= 0.05; audio_group_set_gain(st_selected_audio_group, global.sfx_volume, 0); }
	}	
	
	if st_selected_audio_group == audiogroup_mus
	{
		if st_right_key { global.music_volume += 0.01; audio_group_set_gain(st_selected_audio_group, global.music_volume, 0); }
		if st_left_key { global.music_volume -= 0.01; audio_group_set_gain(st_selected_audio_group, global.music_volume, 0); }
	
	}
}

//select option
if st_confirm_key && st_selected_op != true
{
	switch(st_pos)
	{
		case 0 :
		st_selected_op = true;
		st_selected_audio_group = audiogroup_mus;
		break;
		
		case 1 :
		st_selected_op = true;
		st_selected_audio_group = audiogroup_sfx;
		break;
		
		case 2 :
		window_set_fullscreen(!objSettings.full_screen)
		objSettings.full_screen = !objSettings.full_screen
		st_checked_options[0] = !st_checked_options[0];
		break;
		
		case 3 :
		break;
		
		case 5 :
		global.sfx_volume = 1;
		global.music_volume = 1;
		audio_group_set_gain(audiogroup_mus, global.music_volume, 0);
		audio_group_set_gain(audiogroup_sfx, global.sfx_volume, 0);
		break;
		
		case 6 :
		instance_destroy();
		break;
	
	
	}
}

//destroy menu if not a sound related option is selected
if st_back_key && st_selected_op != true
{
	instance_destroy();
}
else if st_back_key && st_selected_op == true
{
	st_selected_op = false;
	st_selected_audio_group = noone;
	audio_play_sound(sndMenuMove, 1, false);
}