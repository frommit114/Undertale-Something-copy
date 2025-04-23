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
fled = false;
battle_end_condition = "";
battle_ended = false;
battle_wait_time_remaining = 0;
battle_wait_time_frames = 30;
acting = false;
used_item = false;
monster_talking = false;
current_action = -1;
current_targets = noone;

escape_text = "* Escaped...";
gold_string = "";
EXP_string = "";

//Arrays for storing the monsters 
monsterUnits = [];
spared_monsters = [];
killed_monsters = [];

//Monster position params
monster_x = 180 + (20 * array_length(monsterUnits));
monster_y = 130;

monster_sep = 200;

total_items = array_length(objItemManager.inv);

for (var m = 0; m < array_length(monsters); m++)
{
	BMonsters[m] = instance_create_depth(monster_x + (monster_sep * m), monster_y, -15999, ObjBattleMonster, monsters[m]);
	array_push(monsterUnits, BMonsters[m]);
}

monster_length = array_length(BMonsters);
objButtonController.UI_level = 0;
active_monsters = monster_length;


SetSongIngame(BMonsters[0].BattleSong, 0, 0);

function BattleStateSelectAction()
{
	if global.Player.HP <= 0
	{
		battle_state = BattleStateVictoryCheck;
		exit;
	}
	else 
	{
		BeginAction(global.PlayerAttacks.BasicAttack, target[0]);
	}
}

function BeginAction(_action, _targets)
{
	current_action = _action;
	current_targets = _targets;
	if !(is_array(current_targets)) current_targets = [current_targets];
	battle_wait_time_remaining = battle_wait_time_frames;
	battle_state = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
	GetTarget();
	current_action.func(current_targets);
	battle_state = BattleStateMonsterAttack;
}

function BattleStateMonsterAttack()
{
	if !instance_exists(objBulletGenerator)
	{
		PerformMonsterAttack(BMonsters[irandom_range(0, monster_length -1)].Attacks[irandom_range(0, 0)]);
	}
}

function BattleStateVictoryCheck()
{
	battle_state = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	turn_count++;
	current_turn++;
	if (current_turn > 1)
	{
		current_turn = 0
	}
	battle_state = BattleStateSelectAction;
}

battle_state = BattleStateSelectAction;

