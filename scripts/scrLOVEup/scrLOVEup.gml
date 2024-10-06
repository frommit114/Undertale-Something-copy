function LevelUpEXP() 
{
	if global.Player.EXP >= 10 
	{
		global.Player.LOVE = 2;
		global.Player.NextLVEXP = 30;
	}
	if global.Player.EXP >= 30
	{
		global.Player.LOVE = 3;
		global.Player.NextLVEXP = 70;
	}
	if global.Player.EXP >= 70
	{
		global.Player.LOVE = 4;
		global.Player.NextLVEXP = 120;
	}
	if global.Player.EXP >= 120
	{
		global.Player.LOVE = 5; 
		global.Player.NextLVEXP = 200;
	}
	if global.Player.EXP >= 200
	{
		global.Player.LOVE = 6; 
		global.Player.NextLVEXP = 300;
	}
	if global.Player.EXP >= 300 
	{
		global.Player.LOVE = 7; 
		global.Player.NextLVEXP = 500;
	}
	if global.Player.EXP >= 500 
	{
		global.Player.LOVE = 8;
		global.Player.NextLVEXP = 800;
	}
	if global.Player.EXP >= 800 
	{
		global.Player.LOVE = 9;
		global.Player.NextLVEXP = 1200;
	}
	if global.Player.EXP >= 1200
	{
		global.Player.LOVE = 10; 
		global.Player.NextLVEXP = 1700;
	}
	if global.Player.EXP >= 1700
	{
		global.Player.LOVE = 11;
		global.Player.NextLVEXP = 2500;
	}
	if global.Player.EXP >= 2500
	{
		global.Player.LOVE = 12;
		global.Player.NextLVEXP = 3500;
	}
	if global.Player.EXP >= 3500
	{
		global.Player.LOVE = 13;
		global.Player.NextLVEXP = 5000;
	}
	if global.Player.EXP >= 5000
	{
		global.Player.LOVE = 14;
		global.Player.NextLVEXP = 7000;
	}
	if global.Player.EXP >= 7000
	{
		global.Player.LOVE = 15;
		global.Player.NextLVEXP = 10000;
	}
	if global.Player.EXP >= 10000
	{
		global.Player.LOVE = 16;
		global.Player.NextLVEXP = 15000;
	}
	if global.Player.EXP >= 15000
	{
		global.Player.LOVE = 17;
		global.Player.NextLVEXP = 25000;
	}
	if global.Player.EXP >= 25000
	{
		global.Player.LOVE = 18;
		global.Player.NextLVEXP = 50000;
	}
	if global.Player.EXP >= 50000
	{
		global.Player.LOVE = 19;
		global.Player.NextLVEXP = 99999;
	}
	if global.Player.EXP >= 99999
	{
		global.Player.LOVE = 20;
		global.Player.NextLVEXP = 99999;
	}
	global.Player.MaxHP = 20 + ((global.Player.LOVE - 1) * 4);
	if (global.Player.LOVE == 20) 
	{
		global.Player.MaxHP = 99;
	}
}