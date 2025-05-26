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
depth = -15998;


units = [];
turn = 0;
unit_turn_order = [];

turn_count = 0;
current_turn = 0;
round_count = 0;
battle_wait_time_frames = 30;
battle_wait_time_remaining = 0;
action_has_selected = false;
current_action = -1;
targets = [];
current_targets = noone;

//Monster position params
monster_x = 180 + (20 * array_length(units));
monster_y = 130;
monster_sep = 20;

//make ze monsters
for (var m = 0; m < array_length(monsters); m++)
{
	BMonsters[m] = instance_create_depth(monster_x + (monster_sep * m), monster_y, -15999, ObjBattleMonster, monsters[m]);
	array_push(units, BMonsters[m]);
}

unit_turn_order = array_shuffle(units);


function BattleStateSelectAction()
{
	if global.Player.HP <= 0
	{
		battle_state = BattleStateVictoryCheck;
		exit;
	}
	
}

function BeginAction(_action, _targets)
{
	current_action = _action;
	current_targets = _targets;
	if !(is_array(current_targets)) current_targets = [current_targets];
	battle_wait_time_remaining = battle_wait_time_frames;
	performing_action = true;
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


