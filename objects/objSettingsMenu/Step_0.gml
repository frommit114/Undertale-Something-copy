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
switch(st_menu_level)
{
	case 0 :
	if !st_selected_op 
	{
		st_pos += st_down_key - st_up_key;
	}
	if st_pos >= st_op_length {st_pos = 0};
	if st_pos < 0 {st_pos = st_op_length - 1};
	break;
	
	case 1:
	if !st_selected_bind
	{
		st_control_pos += st_down_key - st_up_key;
	}
	if st_control_pos >= st_control_legth {st_control_pos = 0};
	if st_control_pos < 0 {st_control_pos = st_control_legth - 1};
	break;
	
	case 2:
	break;
}


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
	switch(st_menu_level)
	{
		case 0 :
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
		
			case 4 :
			st_menu_level = 1;
			break;
		
			case 5 :
			st_menu_level = 2;
			break;
		
			case 6 :
			global.sfx_volume = 1;
			global.music_volume = 1;
			audio_group_set_gain(audiogroup_mus, global.music_volume, 0);
			audio_group_set_gain(audiogroup_sfx, global.sfx_volume, 0);
			input_player_reset();
			break;
		
			case 7 :
			instance_destroy();
			break;
		}
		break;
		
		case 1:
		verb_to_set = st_bindings[st_control_pos];
		input_binding_scan_start(function(_binding)
		{
			//On success, set a binding and show positive feedback
			input_binding_set_safe(verb_to_set, _binding);
		},
		function(_result)
		{
			//On failure, show negative feedback
			draw_text_color(vx + 100, vy + 300, "Bind reset failed!", c_red, c_red, c_red, c_red, 1);
		})
		
		break;
		
		case 2:
		break;
	}
}

//destroy menu if not a sound related option is selected
if st_back_key
{
	if st_selected_op != true && st_menu_level == 0
	{
		instance_destroy();
	}
	else if st_selected_op == true
	{
		st_selected_op = false;
		st_selected_audio_group = noone;
		audio_play_sound(sndMenuMove, 1, false);
	}
	else if st_menu_level != 0
	{
		st_menu_level = 0;
	}
}