global.PlayerInv = array_create(0);
global.InvMax = 8;


global.ItemList =
{
	Pie : new CreateItem(
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
	)

}