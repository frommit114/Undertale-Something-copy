 //Inputs
 var _up_key = input_check_pressed("up");
 var _down_key = input_check_pressed("down");
 var _right_key = input_check_pressed("right");
 var _left_key = input_check_pressed("left");
it_confirm_key = input_check_pressed("confirm");
it_exit_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_shift);

//Sounds
if (_up_key || _down_key) && (objGameMenu.menu_level == 1) && (submenu_level == 0) {
 audio_play_sound(sndMenuMove, 1, false); 
}
if (_right_key || _left_key) && (objGameMenu.menu_level == 1) && (submenu_level == 1) {
 audio_play_sound(sndMenuMove, 1, false); 
}
if it_confirm_key && (objGameMenu.menu_level == 1) && submenu_level <= 1 {
audio_play_sound(sndSelect, 1, false);
}
if it_exit_key && submenu_level == 0 
{
 audio_play_sound(sndMenuMove, 1, false); 
}
if it_exit_key && submenu_level == 1
{
 audio_play_sound(sndMenuMove, 1, false); 
}

if it_confirm_key && submenu_level == 1
{

	switch(op_pos)
	{
	
		//Use item
		case 0:
		create_textbox(objItemManager.inv[item_pos].text_id[3]);
		objItemManager.inv[item_pos].effect();
		instance_destroy();
		if array_length(objItemManager.inv) == 0 
		{
			instance_destroy();
		}
		break;
		
		//Info
		case 1:
		depth = -15000
		create_textbox(objItemManager.inv[item_pos].text_id[0]);
		instance_destroy();
		break;
		
		//Drop item
		case 2:
		if objItemManager.inv[item_pos].can_drop == true
		{
			create_textbox(objItemManager.inv[item_pos].text_id[2])
			array_delete(objItemManager.inv, objItemMenu.item_pos, 1)
			instance_destroy();
		}
		break;
	
	}

}

//Move through menu
if (objGameMenu.menu_level == 1) && (submenu_level == 0) 
{
item_pos += _down_key - _up_key;
}
if it_confirm_key && (submenu_level == 0) {submenu_level++;}
if it_exit_key && (submenu_level == 0) {submenu_level--;}
if item_pos >= array_length(objItemManager.inv) {item_pos = 0};
if item_pos < 0 {item_pos = array_length(objItemManager.inv) - 1};

//Move through options
if (objGameMenu.menu_level == 1) && (submenu_level == 1) {
op_pos += _right_key - _left_key;
}
if it_exit_key && (submenu_level == 1) {submenu_level --;}
if op_pos >= array_length(item_options) {op_pos = 0};
if op_pos < 0 {op_pos = array_length(item_options) - 1};

if array_length(objItemManager.inv) != 0
{
	if objItemManager.inv[item_pos].item_type == "Armor" || objItemManager.inv[item_pos].item_type == "Weapon"
	{
		item_options[0] = "Equip";
	}
	else if objItemManager.inv[item_pos].item_type == "Consumable"
	{
		item_options[0] = "Use";
	}
}

//Close submenu
if it_exit_key && submenu_level == -1 {
 instance_destroy(objItemMenu);
  objGameMenu.menu_level -= 1;
}