global.Monster =
{
	
	 TestSubject:
	 {
		 
		MonsterName: "Test dummy",
		MonsterHP : 100,
		MonsterMaxHP : 100,
		MonsterATK : 10,
		MonsterDEF : 10,
		MonsterSprites : { idle: sprDummy, hurt: sprWarp },
		Acts : [
		{
			act_name : "Check",
			act_effect : function()
			{
				create_textbox("Test dummy - check");
			}
		}
		, 
		{
			act_name : "Scream",
			act_count : 0,
			act_effect : function()
			{
				switch(act_count)
				{
					case 0:
					create_textbox("Test dummy - scream");
					act_count ++;
					break;
					
					case 1:
					create_textbox("Test dummy - scream 2");
					global.Monster.TestSubject.MonsterATK +=3;
					act_count ++;
					break;
					
					case 2:
					create_textbox("Test dummy - scream");
					break;
				}
			}
		}
		,
		{
			act_name : "Talk",
			act_count : 0,
			act_effect : function()
			{
				switch(act_count)
				{
					case 0:
					create_textbox("Test dummy - scream");
					act_count ++;
					break;
					
					case 1:
					create_textbox("Test dummy - scream 2");
					act_count ++;
					break;
					
					case 2:
					create_textbox("Test dummy - scream");
					break;
				}
			}
		
		}
		],
		Attacks : 
		[
			{
				duration : 360,
				bullet_spawn_x : 100,
				bullet_spawn_y : 350,
				bullet_hspeed : 0,
				bullet_vspeed : 5,
				bullet_dir : 0,
				bullets_to_spawn : choose(100, 150),
				spawn_timer : 5, //time (in frames) that needs to pass for bullets to start spawning
				board_width : 250,
				board_height : 140,
				board_x_offset : 0,
				board_y_offset : 0,
			}
			,
			{
				duration : 360,
				bullet_spawn_x : 100,
				bullet_spawn_y : 350,
				bullet_hspeed : 3, 
				bullet_vspeed : 0,
				bullet_dir : 0,
				bullets_to_spawn : choose(40, 50),
				spawn_timer : 30, 
				board_width : 250,
				board_height : 140,
				board_x_offset : 0,
				board_y_offset : 0,
			
			}
		],
		EXPReward : 5,
		GoldReward : 200,
		CanSpare : false,
		CanFlee : true,
		ShowHealthBar : true,
		Defeated : false,
		Spared : false,
		HasSpared : false,
		BattleSong : musTestSong,

	 },
	 
	 TestMonster :
	 {
		 
		MonsterName: "Test Monster",
		MonsterHP : 150,
		MonsterMaxHP : 150,
		MonsterATK : 5,
		MonsterDEF : 10,
		MonsterSprites : { idle: sprTestMonster, hurt: sprWarp },
		Acts : 
		[
		{
			act_name : "Check",
			act_effect : function()
			{
				create_textbox("Test monster - check");
			}
		}
		, 
		{
			act_name : "Ignore",
			act_count : 0,
			act_effect : function()
			{
				switch(act_count)
				{
					case 0:
					create_textbox("Test monster - ignore");
					act_count ++;
					break;
					
					case 1:
					create_textbox("Test monster - ignore 2");
					global.Monster.TestMonster.MonsterATK +=3;
					act_count ++;
					break;
					
					case 2:
					create_textbox("Test monster - ignore 3");
					with(objBulletBoard)
					{
						BMonsters[act_mons_pos].CanSpare = true;
					}
					act_count ++;
					break;
					
					case 3:
					create_textbox("Test monster - ignore 4");
					break;
				}
			}
		}
		],
		Attacks : 
		[
			{
				duration : 360,
				bullet_spawn_x : 100,
				bullet_spawn_y : 350,
				bullet_hspeed : 0,
				bullet_vspeed : 5,
				bullet_dir : 0,
				bullets_to_spawn : choose(30, 40),
				spawn_timer : 30, //time (in frames) that needs to pass for bullets to start spawning
				board_width : 250,
				board_height : 140,
				board_x_offset : 0,
				board_y_offset : 0,
			}
			,
			{
				duration : 360,
				bullet_spawn_x : 100,
				bullet_spawn_y : 350,
				bullet_hspeed : 3, 
				bullet_vspeed : 0,
				bullet_dir : 0,
				bullets_to_spawn : choose(30, 40),
				spawn_timer : 30, 
				board_width : 250,
				board_height : 140,
				board_x_offset : 0,
				board_y_offset : 0,
			
			}
		],
		EXPReward : 0,
		GoldReward : 200,
		CanSpare : false,
		CanFlee : true,
		ShowHealthBar : true,
		Defeated : false,
		Spared : false,
		HasSpared : false,
		BattleSong : musTestSong,

	 },

}