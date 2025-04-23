global.HealedAmount = 0;

function CreateItem(_name, _desc, _item_type, _sprite, _pickup_txt, _drop_text, _use_text, _effect, _can_drop) constructor
{
	ItemName = _name;
	ItemType = _item_type;
	text_id[0] = _desc;
	text_id[1] = _pickup_txt;
	text_id[2] = _drop_text;
	text_id[3] = _use_text;
	OverworldSprite = _sprite;
	ItemEffect = _effect;
	CanDrop = _can_drop;
}

function ItemAdd(_item)
{	
	if ( array_length(global.PlayerInv) < global.InvMax )
	{
		array_push(global.PlayerInv, _item)
	}
}

function item_add(_item)
{
	if array_length(objItemManager.inv) < objItemManager.inv_max
	{
		array_push(objItemManager.inv, _item)
	} 
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

function ChangePlayerHP(_amount)
{
	var _startingHP = global.Player.HP;
	global.Player.HP += _amount;
	if _amount > 0 { audio_play_sound(sndHeal, 10, false); }
	else if _amount < 0 { audio_play_sound(sndHurt, 10, false); }
	global.HealedAmount = global.Player.HP - _startingHP;
	
}
