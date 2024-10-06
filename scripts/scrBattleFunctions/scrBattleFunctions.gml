function NewEncounter(_monsters, _bg)
{
	instance_create_depth
	(
		0,
		0,
		-15999,
	    objBulletBoard,
		{monsters: _monsters, battle_background : _bg}
		
	);
}

function CheckSteps(_steps)
{
	if (step_count > _steps)
	{
		step_count = 0;
		with objPlayer
		{
			event_user(0);
			audio_play_sound(sndBattleAlert, 0, false);
		}
	}
}

function BattleCleanUp()
{
	objPlayer.visible = true;
	objPlayer.can_move = true;
	objPlayer.show_exclamation = false;
}

function ChangeTurn()
{
	with(objBulletBoard)
	{	
		if current_turn == 0
		{
			current_turn = 1;
			blb_UI_level = -1;
			objButtonController.UI_level = -1;
			enemy_attacking = true;
			for(var i = 0; i < monster_length; i++)
			{
				if BMonsters[i].text_to_draw != ""
				{
					create_textbox(BMonsters[i].text_to_draw);
				}
			}
			turn_count ++;
			exit;
		} 
		if current_turn == 1
		{
			current_turn = 0;
			blb_UI_level = 0;
			objButtonController.UI_level = 0;
			enemy_attacking = false;
			if instance_exists(objBulletGenerator)
			{
				instance_destroy(objBulletGenerator);
			}
			turn_count ++;
			exit;
		}
	}
}

function GetTarget()
{
	with(objBulletBoard)
	{
		
		target[0] = BMonsters[fight_mons_pos];
	
	}
}

function EndBattle()
{
	with(objBulletBoard)
	{
		
		var _exp = 0;
		var _gold = 0;
		
		//Killed monsters reward
		for(var i = 0; i < array_length(killed_monsters); i++)
		{	
			if killed_monsters[i].Defeated 
			{
				_exp = killed_monsters[i].EXPReward;
				_gold = killed_monsters[i].GoldReward;
				global.Player.KillCount += 1;
			}
		}
		
		//Spared monsters reward
		for(var i = 0; i < array_length(spared_monsters); i++)
		{
		    if spared_monsters[i].Spared
			{
				_gold = spared_monsters[i].GoldReward;
				global.Player.SpareCount += 1;

			}
		}
		for(var i = 0; i < monster_length; i++)
		{
			if fled
			{
				_gold = floor(BMonsters[i].GoldReward / 2);
			}
		}
		
		global.Player.Gold += _gold;
		global.Player.EXP += _exp;
		gold_string = string(_gold);
		EXP_string = string(_exp);
		
		blb_UI_level = -1
		battle_ended = true;
		SetSongIngame(noone, 0, 0);
		LevelUpEXP();
		if !fled
		{ 

			create_textbox("Battle - won");
		}
	}
	
}

function BattleEndTransition()
{
	TransitionStart(global.Player.LastRoom, sqFadeOut, sqFadeIn, objPlayer.last_room_x, objPlayer.last_room_y);
}

function PerformPlayerAttack()
{

}

function StartMonsterAttack(_attack)
{
	instance_create_depth(0,0, 1, objBulletGenerator, {attack: _attack})
	
}

function BattleChangeMonsterHP(_target, _amount)
{
	
	var _missed = false;
	var _col = c_red;
	if _amount <= 0 _missed = true;
	if _missed
	{
		_col = c_grey;
		_amount = "MISS";
	}
	
	_target.MonsterHP -= _amount
	
	instance_create_depth(
	_target.x -15,
	_target.y + 10,
	_target.depth - 1,
	objBattleFloatingText,
	{font: fntBattleMonsterHP, col: _col, text: _amount, target_hp: _target.MonsterHP, target_max_hp: _target.MonsterMaxHP}
	)
	


}
