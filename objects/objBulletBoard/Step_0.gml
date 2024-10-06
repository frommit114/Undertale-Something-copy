//Animate
#region //Animate the board widht and height
if (current_width < board_width) {
	current_width += ((board_width - current_width) / 2);
}
if (current_width > board_width) {
	current_width -= ((current_width - board_width) / 2);
}
if (current_height < board_height) {
	current_height += ((board_height - current_height) / 2);
}
if (current_height > board_height) {
	current_height -= ((current_height - board_height) / 2);
}
#endregion
#region //Animate x and y
if (current_x_offset < board_x_offset) {
	current_x_offset += ((board_x_offset - current_x_offset) / 2);
}
if (current_x_offset > board_x_offset) {
	current_x_offset -= ((current_x_offset - board_x_offset) / 2);
}
if (current_y_offset < board_y_offset) {
	current_y_offset += ((board_y_offset - current_y_offset) / 2);
}
if (current_y_offset > board_y_offset) {
	current_y_offset -= ((current_y_offset - board_y_offset) / 2);
}
#endregion



if active_monsters == 0 && !battle_ended
{
	EndBattle();
	
}

//Delete monsters from array
for (var i = 0; i < monster_length; i ++)
{

	if BMonsters[i].Defeated || BMonsters[i].Spared
	{
		array_delete(BMonsters, i, 1);
		monster_length --;
		i = 0;
	}

}

if enemy_attacking && !instance_exists(objBulletGenerator) && !battle_ended && !instance_exists(objTextbox)
{
	instance_create_depth(current_width/2, current_height/2, depth -1, objPlayerSoul);
	StartMonsterAttack(BMonsters[irandom_range(0, monster_length -1)].Attacks[irandom_range(0, 1)]);	
}

for(var i = 0; i < monster_length; i++)
{
	if !BMonsters[i].CanFlee
	{
		array_delete(spare_op, 1, 1);
	}
}


//Inputs
bt_left_key = input_check_pressed("left");
bt_right_key = input_check_pressed("right");
bt_up_key = input_check_pressed("up");
bt_down_key = input_check_pressed("down");
bt_accept_key = input_check_pressed("confirm") || keyboard_check_pressed(vk_enter);

//Sounds
if (bt_right_key || bt_left_key || bt_down_key || bt_up_key) && blb_UI_level > 0
{
 audio_play_sound(sndMenuMove, 1, false); 
}
if bt_accept_key && blb_UI_level > 0
{
 audio_play_sound(sndSelect, 1, false); 
}



//Move through submenus 
switch(blb_UI_level)
{

	case 0 :
	break;
	
	//Fight
	case 1 :
	fight_mons_pos += bt_down_key - bt_up_key;
	if fight_mons_pos >=  monster_length { fight_mons_pos = 0 };
	if fight_mons_pos < 0 {fight_mons_pos =  monster_length - 1 };
	break;
	
	//Act
	case 2 :
	act_mons_pos += bt_down_key - bt_up_key;
	if act_mons_pos >=  monster_length { act_mons_pos = 0 };
	if act_mons_pos < 0 { act_mons_pos = monster_length - 1};
	break;
	
	//Act commands
	case 2.5 :
	total_acts = array_length(BMonsters[act_mons_pos].Acts);
	if (keyboard_check_pressed(vk_up)) 
	{
    current_act_index = (current_act_index - 2 + total_acts) mod total_acts; // Move up
	}

	if (keyboard_check_pressed(vk_down)) 
	{
    current_act_index = (current_act_index + 2) mod total_acts; // Move down
	}

	if (keyboard_check_pressed(vk_left)) 
	{
    current_act_index = (current_act_index - 1 + total_acts) mod total_acts; // Move left
	}

	if (keyboard_check_pressed(vk_right)) 
	{
    current_act_index = (current_act_index + 1) mod total_acts; // Move right
	}
	break;
	
	//Items
	case 3 :
	if (keyboard_check_pressed(vk_up)) 
	{
    current_index = (current_index - 2 + total_items) mod total_items; // Move up
	}

	if (keyboard_check_pressed(vk_down)) 
	{
    current_index = (current_index + 2) mod total_items; // Move down
	}

	if (keyboard_check_pressed(vk_left)) 
	{
    current_index = (current_index - 1 + total_items) mod total_items; // Move left
	}

	if (keyboard_check_pressed(vk_right)) 
	{
    current_index = (current_index + 1) mod total_items; // Move right
	}
	break;
	
	//Mercy
	case 4 :
	mercy_pos += bt_down_key - bt_up_key;
	if mercy_pos >=  array_length(spare_op) { mercy_pos = 0; }
	if mercy_pos < 0 { mercy_pos =  array_length(spare_op) - 1 }
	break;
	
	break;

}

//Perform submenu specific action
switch(blb_UI_level)
{
	case 1 :
	if bt_accept_key 
	{	
		GetTarget();
		BattleChangeMonsterHP(target[0], global.Player.ATK + 50);
		ChangeTurn();
	}
	break;
	
	case 2 :
	if bt_accept_key { blb_UI_level = 2.5 }
	break;
	
	case 2.5 :
	if bt_accept_key 
	{	
		blb_UI_level = -1;
		acting = true;
		BMonsters[act_mons_pos].Acts[current_act_index].act_effect();
	}
	break;
	
	case 3:
	if bt_accept_key
	{
		blb_UI_level = -1;
		objItemManager.inv[current_index].effect();
		used_item = true;
		create_textbox(objItemManager.inv[current_index].text_id[3]);
	}
	break;
	
	case 4 :
	if bt_accept_key
	{
		switch(mercy_pos)
		{
			//Spare
			case 0 :
			for(var i = 0; i < monster_length; i++)
				if !BMonsters[i].Spared && BMonsters[i].CanSpare
				{
					BMonsters[i].Spared = true;
				}
			ChangeTurn();
			break;
			
			//Flee
			case 1 :
				flee_chance = irandom_range(0, 1);
				if flee_chance == 0
				{
					audio_play_sound(sndBell, 1, false);
					ChangeTurn();
				}
				else if flee_chance == 1
				{
					fled = true;
					battle_end_condition = "fled";
					audio_play_sound(sndEscaped, 10, false);
					EndBattle();
					BattleEndTransition();
				}
			
			break;
		}
	}
	break;

}



//Test
if keyboard_check_pressed(vk_shift) && blb_UI_level == 1 {BMonsters[fight_mons_pos].CanSpare = !BMonsters[fight_mons_pos].CanSpare}
if keyboard_check_pressed(vk_alt) && blb_UI_level == 1 {BMonsters[fight_mons_pos].MonsterHP --;}
if keyboard_check_pressed(vk_control) && blb_UI_level == 1 {BMonsters[fight_mons_pos].ShowHealthBar = !BMonsters[fight_mons_pos].ShowHealthBar}

if keyboard_check_pressed(ord("T")) {ChangeTurn();}

with(objTextbox)
{
	if input_check_pressed("confirm") && objBulletBoard.battle_ended && draw_char == text_length[page]
	{
		BattleEndTransition();
	}
}


