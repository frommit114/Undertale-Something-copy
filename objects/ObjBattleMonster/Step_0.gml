if (MonsterHP <= 0) && !Defeated
{
	image_blend = c_red;
	Defeated = true;
	array_push(objBulletBoard.killed_monsters, id);
	objBulletBoard.active_monsters --;
}

if Spared && !HasSpared
{
	image_blend = c_yellow;
	HasSpared = true;
	array_push(objBulletBoard.spared_monsters, id);
	objBulletBoard.active_monsters --;
}