//Params
board_width = 560;
board_height = 140;
current_width = 560;
current_height = 140;
default_width = 560;
default_height = 140;
board_x_offset = 0;
board_y_offset = 0;
current_x_offset = 0;
current_y_offset = 0;
depth = -15998

//Monster position params
monster_x = 180;
monster_y = 130;

monster_sep = 200;

spare_op[0] = "Spare";
spare_op[1] = "Flee";

fight_mons_pos = 0;
act_mons_pos = 0;  
current_act_index = 0;
current_index = 0; 
mercy_pos = 0;


//UI level
blb_UI_level = 0;

bt_move_menu = true;


current_turn = 0; // 0 for player 1 for monster(s)
turn_count = 0; // store number of turns passed
enemy_attacking = false; //if there is an attack on going or not
target[0] = noone;
ready_for_attack = true;
fled = false;
battle_end_condition = "";
battle_ended = false;
battle_wait_time_frames = 30;
acting = false;
used_item = false;


escape_text = "* Escaped...";
gold_string = "";
EXP_string = "";


monsterUnits = [];
spared_monsters = [];
killed_monsters = [];


total_items = array_length(objItemManager.inv);


for (var m = 0; m < array_length(monsters); m++)
{

	BMonsters[m] = instance_create_depth(monster_x + (monster_sep * m), monster_y, -15999, ObjBattleMonster, monsters[m]);
	array_push(monsterUnits, BMonsters[m]);

}

monster_length = array_length(BMonsters);
objButtonController.UI_level = 0;
active_monsters = monster_length;



switch(array_length(monsterUnits))
{
	case 1 :
	monster_x = 300;
	break;
	
	case 2 :
	monster_x = 200;
	break;
}

SetSongIngame(BMonsters[0].BattleSong, 0, 0)






