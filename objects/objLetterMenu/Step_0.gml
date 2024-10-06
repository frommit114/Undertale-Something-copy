 //Inputs
 var _up_key = keyboard_check_pressed(vk_up);
 var _down_key = keyboard_check_pressed(vk_down);
 var _right_key = keyboard_check_pressed(vk_right);
 var _left_key = keyboard_check_pressed(vk_left);
confirm_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
exit_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_shift);

//Sounds
if (_up_key || _down_key) && (objGameMenu.menu_level == 1) && (submenu_level == 0) {
 audio_play_sound(sndMenuMove, 1, false); 
}
if (_right_key || _left_key) && (objGameMenu.menu_level == 1) && (submenu_level == 1) {
 audio_play_sound(sndMenuMove, 1, false); 
}
if confirm_key && (objGameMenu.menu_level == 1) && submenu_level <= 1 {
audio_play_sound(sndSelect, 1, false);
}
if exit_key && submenu_level == 0 
{
 audio_play_sound(sndMenuMove, 1, false); 
}
if exit_key && submenu_level == 1
{
 audio_play_sound(sndMenuMove, 1, false); 
}

//Move through menu
if (objGameMenu.menu_level == 1) && (submenu_level == 0) {
pos += _down_key - _up_key;
}
if confirm_key && (submenu_level == 0) {submenu_level++;}
if exit_key && (submenu_level == 0) {submenu_level--;}
if pos >= lt_length {pos = 0};
if pos < 0 {pos = lt_length - 1};



//Move through options
if (objGameMenu.menu_level == 1) && (submenu_level == 1) {
op_pos += _right_key - _left_key;
}
if exit_key && (submenu_level == 1) {submenu_level --;}
if op_pos >= lt_op_length {op_pos = 0};
if op_pos < 0 {op_pos = lt_op_length - 1};


//Read
if (op_pos == 0) && confirm_key
{
}

//Info
if (op_pos == 1) && confirm_key && submenu_level < 2
{
depth = -15000
create_textbox("Test letter");
instance_destroy();
objGameMenu.menu_level = 0;
}




//Drop
if (op_pos == 2) && confirm_key
{
}

//Close submenu
if exit_key && (submenu_level == -1) {
 objGameMenu.menu_level -= 1;
 instance_destroy(objLetterMenu);
}