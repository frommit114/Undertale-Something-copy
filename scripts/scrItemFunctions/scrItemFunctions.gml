global.HealedAmount = 0;

function item_add(_item)
{
	if array_length(objItemManager.inv) < objItemManager.inv_max
	{
	array_push(objItemManager.inv, _item)
	}
}

function ChangePlayerHP(_amount)
{
	var _startingHP = global.Player.HP;
	global.Player.HP += _amount;
	if _amount > 0 { audio_play_sound(sndHeal, 10, false); }
	else if _amount < 0 { audio_play_sound(sndHurt, 10, false); }
	global.HealedAmount = global.Player.HP- _startingHP;
	
}

function DeleteItem()
{
		if instance_exists(objItemMenu)
		{
			array_delete(inv, objItemMenu.item_pos, 1);
		}
		else if instance_exists(objBulletBoard)
		{
			array_delete(inv, objBulletBoard.current_index, 1);
			objBulletBoard.total_items = array_length(inv);
		}
}