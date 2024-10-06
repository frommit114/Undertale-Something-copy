//Player data
global.Player =
       {
	       Name :  "Doritos",
		   HP :  20,
		   MaxHP :  20,
		   SoulSpeed : 2,
		   InvFrames : 0,
		   MaxInvFrames : 30,
		   ATK :  0,
		   DEF :  0,
		   Weapon : noone,
		   Armor : noone,
		   KillCount : 0,
		   SpareCount : 0,
		   EXP : 0,
		   LOVE  : 1,
		   NextLVEXP : 10,
		   Gold : 0,
		   Dead : false,
		   X : 0,
		   Y : 0,
		   LastRoom : noone,
	   };
	   
global.Player.MaxHP = 20 + ((global.Player.LOVE - 1) * 4);	  
global.Player.HP = clamp(global.Player.HP, 0, global.Player.MaxHP);
