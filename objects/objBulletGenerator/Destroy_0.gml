instance_destroy(objBullet);
ChangeTurn();
objBulletBoard.board_width = objBulletBoard.default_width;
objBulletBoard.board_height = objBulletBoard.default_height;
objBulletBoard.board_y_offset = 0;
objBulletBoard.board_x_offset = 0;
instance_destroy(objPlayerSoul);