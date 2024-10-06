if input_check_long_pressed("close_game")
{
	game_end();
}
global.Player.HP = clamp(global.Player.HP, 0, global.Player.MaxHP);