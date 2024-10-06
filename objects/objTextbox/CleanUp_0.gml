if position[page] == "Top" && instance_exists(objGameMenu)
{
objGameMenu.menu_position = "Top"
}
if instance_exists(objShopMenu) && objShopMenu.sh_menu_level == -1  && objShopMenu.sh_exit == false
{
	objShopMenu.sh_menu_level = 3;
}

if instance_exists(objGameMenu) && objGameMenu.menu_level == 1
{
	objGameMenu.menu_level = 0
}

if instance_exists(objBulletBoard) && (objBulletBoard.acting == true  || objBulletBoard.used_item == true)
{
	ChangeTurn();
	objBulletBoard.acting = false;
	objBulletBoard.used_item = false;
}

if instance_exists(objCutscene)
{
	with(objCutscene)
	{
		 CutsceneEndAction();
	}
}
