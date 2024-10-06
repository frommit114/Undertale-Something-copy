global.PlayerAttack =
{
	testAttack :
	{
		attackanimation : sprKnifeSlash,
		func : function(_targets)
		{
			var _damage = ceil(global.Player.ATK + random_range(-global.Player.ATK *0.25, global.Player.ATK *0.25) - global.Monster.MonsterDEF *.5)
			BattleChangeMonsterHP(objBulletBoard.target[0], _damage)
		}
	}
}