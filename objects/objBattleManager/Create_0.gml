units = [];

//Monster position params
monster_x = 180 + (20 * array_length(units));
monster_y = 130;


//make ze monsters
for (var m = 0; m < array_length(monsters); m++)
{
	BMonsters[m] = instance_create_depth(monster_x + (monster_sep * m), monster_y, -15999, ObjBattleMonster, monsters[m]);
	array_push(units, BMonsters[m]);
}

