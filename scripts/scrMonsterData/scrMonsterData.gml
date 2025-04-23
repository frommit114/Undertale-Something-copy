function MonsterData( _MonsterName, _MonsterHP, _MonsterMaxHP, _MonsterATK, _MonsterDEF, _MonsterSprites = {}, _Acts = [], _Attacks = [], _EXPReward, _GoldReward, _CanSpare, _CanFlee, _ShowHealthBar, _BattleSong ) constructor
{
	MonsterName = _MonsterName;
	MonsterHP = _MonsterHP;
	MonsterMaxHP = _MonsterMaxHP;
	MonsterATK = _MonsterATK;
	MonsterDEF = _MonsterDEF;
	MonsterSprites = _MonsterSprites;
	Acts = _Acts;
	Attacks = _Attacks;
	EXPReward = _EXPReward;
	GoldReward = _GoldReward;
	CanSpare = _CanSpare;
	CanFlee = _CanFlee;
	ShowHealthBar = _ShowHealthBar;
	BattleSong = _BattleSong;
	Defeated = false;
	Spared = false;
	HasSpared = false;
}

function MonsterSpritesCons( _idle, _hurt, _defeated ) constructor
{
	Idle = _idle;
	Hurt = _hurt;
	Defeated = _defeated;
}

function MonsterAttack( _Duration, _ObjToSpawn, _SpawnX, _SpawnY, _Hspeed, _Vspeed, _ObjDir, _NumberToSpawn, _SpawnTimer, _BoardWidth = 560, _BoardHeight = 140, _BoardXOffset = 0, _BoardYOffset = 0 ) constructor
{
	Duration = _Duration;
	ObjToSpawn = _ObjToSpawn;
	SpawnX = _SpawnX;
	SpawnY = _SpawnY;
	Hspeed = _Hspeed;
	Vspeed = _Vspeed;
	ObjDir = _ObjDir;
	NumberToSpawn = _NumberToSpawn;
	SpawnTimer = _SpawnTimer;
	BoardWidth = _BoardWidth;
	BoardHeight = _BoardHeight;
	BoardXOffset = _BoardXOffset;
	BoardYOffset = _BoardYOffset;
}

function MonsterAct(_act_name, _act_effect) constructor
{
	act_count = 0;
	act_name = _act_name;
	act_effect = _act_effect;
}


global.Monster =
{
	Dummy : new MonsterData(
	"Dummy",
	10,
	10,
	1,
	1,
    new MonsterSpritesCons(
	sprDummy,
	sprDummy,
	sprDummy
	),
	[
		new MonsterAct(
			"Check",
			function()
			{
				create_textbox("Test dummy - check", 5);
			},
		),
		new MonsterAct(
			"Scream",
			function()
			{
				switch(global.Monster.TestSubject.Acts[1].act_count)
				{
					case 0:
					create_textbox("Test dummy - scream", 5);
					global.Monster.TestSubject.Acts[1].act_count++
					break;
					
					case 1:
					create_textbox("Test dummy - scream 2", 5);
					global.Monster.TestSubject.MonsterATK +=3;
					global.Monster.TestSubject.Acts[1].act_count++
					break;
					
					case 2:
					create_textbox("Test dummy - scream", 5);
					break;
				}
			},
		)
	
	],
	[
		global.MonsterAttacks.MonsterTestAttack
	],
	1,
	1,
	false,
	true,
	true,
	musTestSong
	),
	
	Froggit : new MonsterData(
	"Froggit",
	20,
	20,
	2,
	4,
	new MonsterSpritesCons(
	sprTestMonster,
	sprWall,
	sprWarp
	),
	[
		new MonsterAct(
		"Check",
		function()
		{
			create_textbox("Test dummy - check", 5);
		},
		)
	],
	[
		new MonsterAttack(
		360,
		objBullet,
		600,
		irandom_range(100, 300),
		3,
		0,
		180,
		50,
		30
		)
	],
	5,
	10,
	false,
	true,
	true,
	musTestSong
	)
}