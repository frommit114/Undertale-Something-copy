 //Inputs
var _exit_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_shift);
 
 if _exit_key {
 objGameMenu.menu_level -= 1;
 audio_play_sound(sndMenuMove, 1 , false);
 instance_destroy(objStatMenu);
 }