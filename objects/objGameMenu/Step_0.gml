 //Inputs
 var _up_key = input_check_pressed("up");
 var _down_key = input_check_pressed("down");
confirm_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
exit_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_shift);
open_key = keyboard_check_pressed(ord("C"));

//Sounds
if menu_can_move == true
{
	if (_up_key || _down_key) && (menu_level == 0) 
	{
		audio_play_sound(sndMenuMove, 1, false); 
	}
	if confirm_key && (menu_level == 0) && !audio_is_playing(sndBell)
	{
		audio_play_sound(sndSelect, 1, false);
	}
}

//close menu
if exit_key && (menu_level == 0) && instance_exists(objGameMenu) && (confirm_key == false) 
{
    instance_destroy(objGameMenu);
}

//Move through menu
if (menu_level == 0) && menu_can_move == true
{
	pos += _down_key - _up_key;
}
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length - 1};


//Select the options
if confirm_key && menu_can_move == true
{
	switch(pos)
	{

	case 0:
	
	//Items
	
	if array_length(objItemManager.inv) != 0
	{
		if menu_level != 1
		{
			instance_create_depth(vx + 100, vy + 100, -16000, objItemMenu)
			menu_level += 1;
		}
	}
	
	break;
	
	case 1:
	
	//Stats
	
	if (menu_level != 1)  
	{
		instance_create_depth(vx + 100, vy + 100, -16000, objStatMenu)
		menu_level += 1;
	}

	break;
	
	case 2:
	
	//Letters

	if (menu_level != 1)  
	{
		instance_create_depth(vx + 100, vy + 100, -16000, objLetterMenu)
		menu_level += 1;
	}

	break;
	
	case 3 :
	
	//Settings
	
	if (menu_level != 1)  
	{
		instance_create_depth(vx + 100, vy + 100, -16000, objSettingsMenu)
		menu_level += 1;
	}
	
	
	break;
	}
}


if confirm_key && array_length(objItemManager.inv) == 0 && menu_can_move == true
{
	if pos == 0 && menu_level != 1
	{
	audio_play_sound(sndBell, 8, false)
	}
}





// test stuff
if keyboard_check_pressed(ord("O")) {
global.Player.Gold --;
}
if keyboard_check(ord("U")) {
global.Player.Gold ++;
}

//toggle player movement
if instance_exists(objGameMenu)
{
	objPlayer.can_move = false
}
