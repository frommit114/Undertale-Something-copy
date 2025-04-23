instance_destroy(objBullet);
//ChangeTurn();
with(objBulletBoard)
{
	objBulletBoard.board_width = objBulletBoard.default_width;
	objBulletBoard.board_height = objBulletBoard.default_height;
	objBulletBoard.board_y_offset = 0;
	objBulletBoard.board_x_offset = 0;
	battle_state = BattleStateVictoryCheck;
}
instance_destroy(objPlayerSoul);
