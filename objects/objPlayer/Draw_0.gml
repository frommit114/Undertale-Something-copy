if show_exclamation == true
{
	draw_sprite(sprBattleAlert, 0, x, y - 32)
}
draw_self()

draw_sprite(sprWall, 0, global.CameraX, global.CameraY)