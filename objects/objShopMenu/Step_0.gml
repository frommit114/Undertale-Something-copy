//Inputs
sh_up_key = keyboard_check_pressed(vk_up);
sh_down_key = keyboard_check_pressed(vk_down);
sh_confirm_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
sh_exit_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_shift);

//Move through menu
if (sh_menu_level == 0) && sh_can_move == true
{
sh_pos += sh_down_key - sh_up_key;
}
if sh_pos >= sh_op_length {sh_pos = 0};
if sh_pos < 0 {sh_pos = sh_op_length - 1};
//Items
if (sh_menu_level == 1) && sh_can_move == true
{
sh_item_pos += sh_down_key - sh_up_key;
}
if sh_item_pos >= sh_item_length +1{sh_item_pos = 0};
if sh_item_pos < 0 {sh_item_pos = sh_item_length - 1};
//Item buy options
if (sh_menu_level == 1.5) && sh_can_move == true
{
sh_item_op_pos += sh_down_key - sh_up_key;
}
if sh_item_op_pos >= sh_item_op_length {sh_item_op_pos = 0};
if sh_item_op_pos < 0 {sh_item_op_pos = sh_item_op_length - 1};
//Talk options
if (sh_menu_level == 3) && sh_can_move == true
{
sh_talk_pos += sh_down_key - sh_up_key;
}
if sh_talk_pos >= talk_op_length {sh_talk_pos = 0};
if sh_talk_pos < 0 {sh_talk_pos = talk_op_length - 1};
if sh_exit_key && sh_menu_level > 0 && sh_menu_level != 1.5 {sh_menu_level = 0 sh_talk_pos = 0 sh_item_pos = 0 instance_destroy(objTextbox) instance_destroy(objShopDescBox) };
if sh_exit_key && sh_menu_level == 1.5 {sh_menu_level = 1 instance_destroy(objTextbox)}
if sh_confirm_key && sh_menu_level == 1 {instance_destroy(objTextbox)}
if sh_item_pos == 4 {objShopDescBox.sh_desc_box_height = 40 objShopDescBox.sh_item_desc_y = 250}
else if sh_item_pos != 4 {sh_item_desc_y = 100; 	if instance_exists(objShopDescBox) {objShopDescBox.sh_desc_box_height = 180; objShopDescBox.sh_item_desc_current_y= 90;}}


if sh_confirm_key && sh_menu_level == 0
{
	switch (sh_pos)
	{
		
		//Buy
		case 0:
		sh_menu_level = 1;
		instance_destroy(objTextbox);
		sh_can_move = false;
		break;
		
		//Sell
		case 1:
		sh_menu_level = 2;
		instance_destroy(objTextbox);
		break;
		
		//Talk
		case 2:
		sh_menu_level = 3;
		instance_destroy(objTextbox);
		sh_can_move = false;
		break;
		
		//Exit
		case 3:
		sh_exit = true
		sh_menu_level = -1
	    instance_destroy(objTextbox);
		create_textbox(shopkeeper.shpk_text.text_id[13])
		if objTextbox.draw_char == objTextbox.text_length[objTextbox.page] 
		{
		TransitionStart(global.Player.LastRoom, sqFadeOut, sqFadeIn, 110, 55);
		}
		break;
	
	}
}

if sh_confirm_key && sh_menu_level == 1.5
{

	switch(sh_item_op_pos)
	{
		case 0:
		if global.Player.Gold >= shopkeeper.shpk_items.item_price[sh_item_pos] && array_length(objItemManager.inv) != objItemManager.inv_max
		{
			item_add(shopkeeper.shpk_items.sh_item[sh_item_pos]);
			audio_play_sound(sndBuyItem, 8, false);
			global.Player.Gold -= shopkeeper.shpk_items.item_price[sh_item_pos];
			instance_destroy(objTextbox);
			sh_menu_level = 1;
			sh_can_move = false;
			sh_buyed = true;
		}
		else
		{
			instance_destroy(objTextbox)
			sh_menu_level = 1;
			sh_can_move = false;
		}
		break;
		
		case 1:
		instance_destroy(objTextbox);
		sh_menu_level = 1;
		sh_can_move = false;
		break;
	
	
	}

}


