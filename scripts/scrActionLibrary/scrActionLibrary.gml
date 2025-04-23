global.PlayerAttacks = 
{
	BasicAttack :
	{
		attackanimation : sprKnifeSlash,
		func : function(_targets)
		{
			var _damage = 50
			BattleChangeMonsterHP(objBulletBoard.target[0], _damage)
		}
	}
}

global.MonsterAttacks =
{
	MonsterTestAttack : new MonsterAttack(
		360,
		objBullet,
		600,
		irandom_range(100, 300),
		3,
		0,
		180,
		50,
		30
		),
	
}
