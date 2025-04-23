switch(call_type)
{
	case 0 :
	if(instance_exists(objPlayer))
	{
		objPlayer.can_move = true;
	}
	break;
	
	case 1 :
	if(instance_exists(objPlayer))
	{
		objPlayer.can_move = true;
	}
	objNPC.image_speed = 0;
	objNPC.image_index = 0;
	break;
	
	case 2 :
	with(objCutscene)
	{
		 CutsceneEndAction();
	}
	break;
	
	case 3 :
	with(objBulletBoard)
	{
		monster_talking = false;
	}
	break;
	
	case 4 :
	with(objBulletBoard)
	{
		used_item = false;
		ChangeTurn();
	}
	break;
	
	case 5 :
	with(objBulletBoard)
	{
		acting = false;
		monster_talking = false;
		ChangeTurn();	
	}
	break;
	
	case 6 :
	objGameMenu.menu_level = 0;
	break;
	
	case 7 :
	objShopMenu.sh_menu_level = 3;
	break;
}


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

