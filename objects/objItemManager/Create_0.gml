function create_item(_name, _desc, _item_type, _sprite, _pickup_txt, _drop_text, _use_text, _effect, _can_drop) constructor
	{
	item_name = _name;
	item_type = _item_type;
	text_id[0] = _desc;
	text_id[1] = _pickup_txt;
	text_id[2] = _drop_text;
	text_id[3] = _use_text;
	sprite = _sprite;
	effect = _effect;
	can_drop = _can_drop;
	}

global.item_list =
{
	pie : new create_item(
	"Pie", 
	"Pie description",
	"Consumable",
	sprWall,
	"Pie pickup text",
	"Pie drop text",
	"Pie use text",
	
	function()
	{
		 ChangePlayerHP(global.Player.MaxHP);
	
		//Delete the item
		 DeleteItem();
	},
	
	true

	),
	
	wall : new create_item(
	"A wall",
	"Wall description",
	sprWarp,
	"Wall pickup text"
	),
	
	test_weapon : new create_item(
	"Test weapon",
	"Pie description",
	"Weapon",
	sprWall,
	"Pie pickup text",
	"text",
	"text",
	
	function()
	{
		global.Player.ATK += 3;
		global.Player.Weapon = global.item_list.test_weapon
		global.PlayerAttack = global.PlayerAttack.testAttack;
		
		DeleteItem();
	
	},
	true
	
	),
	
	test_armor : new create_item(
	"Test Armor",
	"Pie description",
	"Armor",
	sprWall,
	"Pie pickup text",
	"text",
	"text",
	
	function()
	{	
		global.Player.DEF += 3;
		global.Player.Armor = global.item_list.test_armor
		
		DeleteItem();
	
	},
	true
	
	
	
	)
	
	
}

//create the inventory
inv = array_create(0);
inv_max = 8;

