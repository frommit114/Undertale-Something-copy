if attack.SpawnTimer == 0 && bullets_spawned <= attack.NumberToSpawn
{
		 var _y = irandom_range(250, 380)
		 bullet = instance_create_depth(attack.SpawnX, _y, objBulletBoard.depth - 1, attack.ObjToSpawn);
		 bullet.hspeed = attack.Hspeed;
		 bullet.vspeed = attack.Vspeed;
		 bullet.direction = attack.ObjDir;
		 bullets_spawned ++;
		 attack.SpawnTimer = bullet_spawn_time;
}
else 
{
	attack.SpawnTimer --;
}



