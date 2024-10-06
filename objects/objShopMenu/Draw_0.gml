//Draw big box for the dialogue
draw_sprite_ext(sprite_index, image_index, sh_box_x, sh_box_y, width / sprite_width, height / sprite_height, 0, c_white, 1);

if sh_menu_level == 1  || sh_menu_level == 1.5
{


}

draw_sprite(shopkeeper.shpk_sprites.bg_sprite, 0, 0, 0)


//Draw box for the options
if sh_menu_level != -1 
{
	draw_sprite_ext(sprite_index, image_index, option_box_x, sh_box_y, option_box_width / sprite_width, option_box_height / sprite_height, 0, c_white, 1);
}
//Draw the options
draw_set_font(fntStore)
if sh_menu_level == 0 
{
	for (var i = 0; i < sh_op_length; i++)
	{
		var _c = c_white
		if sh_pos == i && (sh_menu_level == 0) {_c = c_yellow}
	    draw_text_color(sh_option_x + sh_op_border, sh_option_y + sh_op_border + sh_op_space * i, sh_options[i], _c, _c, _c, _c, 1);
	    if sh_pos == i  && (sh_menu_level == 0) {draw_sprite_ext(sprSoul, 0, sh_option_x + sh_op_border - 20, sh_option_y + sh_op_border + sh_op_space * i + 13, 1, 1, 0, c_white, 1);}
	}
}

//Draw the items and price
if sh_menu_level == 1 || sh_menu_level == 1.5
{

		for (var i = 0; i < sh_item_length; i++)
		{
			draw_set_font(fntBig)
		    draw_text_color(sh_item_x + sh_op_border -120, sh_item_y + sh_op_border + sh_item_space * i, string(shopkeeper.shpk_items.item_price[i]) + "G - "  + shopkeeper.shpk_items.sh_item_name[i], c_white, c_white, c_white, c_white, 1);
		    if sh_item_pos == i  && (sh_menu_level == 1) && sh_menu_level != 1.5 {draw_sprite_ext(sprSoul, 0, sh_item_x + sh_op_border - 140, sh_item_y + sh_op_border + sh_item_space * i + 13, 1, 1, 0, c_white, 1);}
			if sh_confirm_key && sh_can_move == true
			{
				sh_menu_level = 1.5;
			}
			
			if !instance_exists(objShopDescBox)
			{instance_create_depth(0, 0, -15999, objShopDescBox);}
			draw_text(sh_item_x - 100, sh_option_y + 194, "Exit");
			if sh_item_pos = 4  && (sh_menu_level == 1) && sh_menu_level != 1.5 {draw_sprite_ext(sprSoul, 0, sh_item_x + sh_op_border - 140, sh_item_y + 210, 1, 1, 0, c_white, 1);}
		}

	sh_can_move = true;
		
}
//Textbox for menu level 1
if sh_menu_level == 1
{
			if !instance_exists(objTextbox) && sh_menu_level == 1 && sh_menu_level != 1.5 && sh_buyed == false
			{
				create_textbox(shopkeeper.shpk_text.text_id[5]);
			}
			else if sh_menu_level == 1.5
			{
			with (objTextbox)
			instance_destroy();
			}
			else if sh_buyed == true && !instance_exists(objTextbox) && sh_menu_level != 1.5
			{
				create_textbox(shopkeeper.shpk_text.text_id[7])
			}	
}

if sh_menu_level == 1.5
{

	for (var i = 0; i < sh_item_op_length; i++)
	{
		draw_set_font(fntStore)
		var _c = c_yellow
		if sh_item_op_pos == i && (sh_menu_level == 1.5) {_c = c_yellow}
	    draw_text_color(sh_option_x + sh_op_border, sh_item_y + sh_op_border + sh_item_op_space * i + 75, sh_item_options[i], c_white, c_white, c_white, c_white, 1);
	    if sh_item_op_pos == i  && (sh_menu_level == 1.5) {draw_sprite_ext(sprSoul, 0, sh_option_x + sh_op_border - 18, sh_item_y + sh_op_border + sh_item_op_space * i + 90, 1, 1, 0, c_white, 1);}
		if sh_menu_level == 1.5 && !instance_exists(objTextbox)
		{
			create_textbox(shopkeeper.shpk_text.text_id[6]);
		}
	}
	sh_buyed = false;

}



//Draw talk options
if sh_menu_level == 3
{
	for (var i = 0; i < talk_op_length; i++)
	{
		
		draw_set_font(fntStore)
		var _c = c_white;
		if sh_talk_pos == i && (sh_menu_level == 3) {_c = c_yellow}
	    draw_text_color(sh_item_x + sh_op_border - 120, sh_item_y + sh_op_border + sh_item_space * i, shopkeeper.shpk_text.talk_op[i], _c, _c, _c, _c, 1);
	    if sh_talk_pos == i  && (sh_menu_level == 3) {draw_sprite_ext(sprSoul, 0, sh_item_x + sh_op_border - 140, sh_item_y + sh_op_border + sh_item_space * i + 13, 1, 1, 0, c_white, 1);}
		if !instance_exists(objTextbox) && sh_menu_level == 3 && sh_menu_level != -1
		{
			create_textbox(shopkeeper.shpk_text.text_id[8])
		}
		else if sh_menu_level == -1
		{
		instance_destroy(objTextbox)
		}
		if sh_confirm_key && sh_can_move == true && instance_number(objTextbox) <  2
		{
			sh_menu_level = -1;
			create_textbox(shopkeeper.shpk_text.text_id[sh_talk_pos + 9]);
			objTextbox.can_advance = true;
		}
	}


	sh_can_move = true;
}



//Draw some player info
if sh_menu_level != -1 
{
	draw_set_font(fntStore)
	draw_text(470, 428, string(global.Player.Gold) + "G");
	draw_text(545, 428, string(array_length(objItemManager.inv)) + "/" + string(objItemManager.inv_max));
}

//Create the welcome dialogue

if !instance_exists(objTextbox) && sh_menu_level == 0
{
	
create_textbox(shopkeeper.shpk_text.text_id[4])

}


