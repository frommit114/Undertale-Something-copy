right_key = input_check_pressed("right");
left_key = input_check_pressed("left");
confirm_key = keyboard_check_pressed(vk_enter) || input_check_pressed("confirm");
back_key = input_check_pressed("cancel") || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_shift);

//Sounds
if (right_key || left_key) && UI_level == 0
{
 audio_play_sound(sndMenuMove, 1, false); 
}
if confirm_key && UI_level == 0
{
audio_play_sound(sndSelect, 1, false);
}






//Move through the buttons
if UI_level == 0 
{
button_pos += right_key - left_key;
}
if button_pos >= button_length {button_pos = 0};
if button_pos < 0 {button_pos = button_length - 1};

//Back out of an option
if back_key && UI_level != 0 && UI_level != -1 && objBulletBoard.blb_UI_level != 2.5 && !objBulletBoard.acting
{
	UI_level --; 
	objBulletBoard.blb_UI_level = 0; 
	objBulletBoard.fight_mons_pos = 0;
	objBulletBoard.act_mons_pos = 0;
	objBulletBoard.current_act_index = 0;
	objBulletBoard.bt_item_pos = 0;
	objBulletBoard.mercy_pos = 0;
}
else if back_key && UI_level != 0 && UI_level != -1 && objBulletBoard.blb_UI_level == 2.5 
{
	objBulletBoard.blb_UI_level = 2;
	objBulletBoard.current_act_index = 0;
	audio_play_sound(sndMenuMove, 1, false);
}


if confirm_key && UI_level == 0
{
	switch(button_pos) 
	{
	
		//Fight
		case 0:
		UI_level ++;
		objBulletBoard.blb_UI_level = 1;
		break;
	
		//Act
		case 1:
		UI_level ++;
		objBulletBoard.blb_UI_level = 2;
		break;
	
		//Items
		case 2:
		if array_length(objItemManager.inv) != 0
		{
		UI_level ++;
		objBulletBoard.blb_UI_level = 3;
		}
		break;
	
		//Mercy
		case 3:
		UI_level ++;
		objBulletBoard.blb_UI_level = 4;
		break;
	
	}
}







