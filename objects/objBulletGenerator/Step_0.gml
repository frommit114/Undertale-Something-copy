if attack.spawn_timer == 0 && bullets_spawned <= attack.bullets_to_spawn
{
		 var _y = irandom_range(250, 380)
		 bullet = instance_create_depth(attack.bullet_spawn_x, _y, objBulletBoard.depth - 1, objBullet);
		 bullet.hspeed = attack.bullet_hspeed;
		 bullet.vspeed = attack.bullet_vspeed;
		 bullet.direction = attack.bullet_dir;
		 bullets_spawned ++;
		 attack.spawn_timer = bullet_spawn_time;

}
else 
{
	attack.spawn_timer --;
}



