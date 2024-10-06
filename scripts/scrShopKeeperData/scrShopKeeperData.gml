global.shpkdat = 0
with (objItemManager) 
{

function shopkeeperitemdata(_item_1, _item_2, _item_3, _item_4, _item_1_name, _item_2_name, _item_3_name, _item_4_name,  _item_1_price, _item_2_price,  _item_3_price,  _item_4_price, _item_1_info, _item_2_info, _item_3_info, _item_4_info ) constructor
{

		sh_item[0] = _item_1;
		sh_item[1] = _item_2;
		sh_item[2] = _item_3;
		sh_item[3]= _item_4;
		sh_item_name[0] = _item_1_name;
		sh_item_name[1] = _item_2_name;
		sh_item_name[2] = _item_3_name;
		sh_item_name[3] = _item_4_name;
		item_price[0] = _item_1_price;
		item_price[1] = _item_2_price;
		item_price[2] = _item_3_price;
		item_price[3] = _item_4_price;
		text_id[0] = _item_1_info;
		text_id[1] = _item_2_info;
		text_id[2] = _item_3_info;
		text_id[3] = _item_4_info;
		sh_item_length = array_length(sh_item)
		
}

function shopkeepertextdata (_welcome_txt, _buy_text, _buy_confirm, _buy_thanks, _talk_txt ,_talk_1, _talk_2, _talk_3, _talk_4, _talk_op_1, _talk_op_2, _talk_op_3, _talk_op_4, _goodbye_text ) constructor
{

	    text_id[4] = _welcome_txt;
	    text_id[5] = _buy_text;
	    text_id[6] = _buy_confirm;
 	    text_id[7] = _buy_thanks;
	    text_id[8] = _talk_txt;
	    text_id[9] = _talk_1;
 	    text_id[10] = _talk_2;
	    text_id[11] = _talk_3;
	    text_id[12] = _talk_4;
	    talk_op[0] = _talk_op_1;
	    talk_op[1] = _talk_op_2;
	    talk_op[2] = _talk_op_3;
	    talk_op[3] = _talk_op_4;
	    text_id[13] = _goodbye_text;    
	    talk_op_length = array_length(talk_op)

}

function shopkeeperspritedata (_backgorund) constructor
{

	bg_sprite = _backgorund;


}


global.shpkdat = 
{

	    test : 
		{ 
		shpk_items : new shopkeeperitemdata(
		global.item_list.pie,
		global.item_list.pie,
		global.item_list.pie,
		global.item_list.pie,
		global.item_list.pie.item_name,
		global.item_list.pie.item_name,
		global.item_list.pie.item_name,
		global.item_list.pie.item_name,
		1000,
		100,
		10,
	     1,
	    "ITEM",
		"Pie description",
		"Pie description",
		"Pie description"
		), 
		shpk_text : new shopkeepertextdata( 
		"Shop test",
		"Shop test - buy",
		"Shop - test - confirm",
		"Shop - test - thanks",
		"Shop - test - talk",
		"Shop - test - talk 1",
		"Shop test",
		"Shop test",
		"Shop test",
		"Why are u invisible",
		"When will this be ready",
		"Can i buy stuff", 
		"The test rooms",
		"Shop - test - goodbye"
		),
		shpk_sprites : new shopkeeperspritedata(
		sprShopBGTest
		)
		},

	
	
	
	
}


}