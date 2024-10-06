//Borders for the bullet board
border_l = (320 + current_x_offset) - (current_width / 2);
border_r = (320 + current_x_offset) + (current_width / 2);
border_u = (380 + current_y_offset) - current_height;
border_d = (380 + current_y_offset);

if instance_exists(objPlayerSoul)
{
	objPlayerSoul.x = clamp(objPlayerSoul.x, border_l + 10, border_r - 10);
	objPlayerSoul.y = clamp(objPlayerSoul.y, border_u + 10, border_d - 10);
}


//Draw Background for battle
draw_sprite(battle_background, 0, 0, 0)

draw_set_color(c_white);
draw_rectangle(border_l - 6, border_u - 6, border_r + 6, border_d + 6, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);


//Draws "HP" text
draw_set_font(fntWidgets);
draw_set_color(c_white);
draw_text(250, 397, "HP");

//Draws the battle text
if blb_UI_level == 0 && !instance_exists(objTextbox) && current_width == default_width && current_height == default_height
{
create_textbox("Test Battle");
objTextbox.can_advance = false;
}

draw_set_font(fntBig)
switch (blb_UI_level)
{

	case 0 :
	break;
	
	// Fight 
	case 1 :
	for (var m = 0; m <  monster_length; m++)
	{
		var _c = c_white;
		if BMonsters[m].CanSpare == true { _c = c_yellow; }
		if !BMonsters[m].Defeated
		{
			draw_text_color(border_l + 50, border_u + 15 + (30 * m), "* " + BMonsters[m].MonsterName, _c, _c, _c, _c, 1 );
		}
		if fight_mons_pos == m 
		{
			draw_sprite_ext(sprSoul, 0, border_l + 30,  border_u + (30 * m) + 30, 1, 1, 0, c_white, 1 );
		}
	}
	break;
	
	//Act Submenu
	case 2 :
	for (var m = 0; m < monster_length; m++)
	{
		var _c = c_white;
		if BMonsters[m].CanSpare == true { _c = c_yellow; }
		draw_text_color(border_l + 50, border_u + 15 + (30 * m), "* " + BMonsters[m].MonsterName, _c, _c, _c, _c, 1 );
		if act_mons_pos == m 
		{
			draw_sprite_ext(sprSoul, 0, border_l + 30,  border_u + (30 * m) + 30, 1, 1, 0, c_white, 1 );
		}
	}
	break;
	
	//Act commands
	case 2.5 :
	for (var a = 0; a < array_length(BMonsters[act_mons_pos].Acts); a++)
	{
	    // Calculate row and column
	    var column = a div 2; // 3 columns
	    var row = a mod 2;    // 2 rows
		
		draw_text(border_l + 50 + (row * 300), border_u + (column * 30) + 15, "* " + BMonsters[act_mons_pos].Acts[a].act_name);
	
		if a == current_act_index
		{
			draw_sprite(sprSoul, 0, border_l + 30 + (row * 300), border_u + (column * 30) + 30 );
		}
	}
	break;
	
	//Items
	case 3 :
	for (var i = 0; i < array_length(objItemManager.inv); i++) 
	{
	    // Calculate row and column
	    var column = i div 2; // 3 columns
	    var row = i mod 2;    // 2 rows

	    // Draw the text
		var _c = c_white;
		if i == current_index  { draw_sprite(sprSoul, 0, border_l + 30 + (row * 300), border_u + (column * 30) + 30 ); }
	    draw_text_color(border_l + 50 + (row * 300), border_u + (column * 30) + 15, "* " + objItemManager.inv[i].item_name, _c, _c, _c, _c, 1);
	}
	break;
	
	//Spare and flee
	case 4 :
	var _c = c_white;
	for (var i = 0; i < monster_length; i ++)
	{
		if BMonsters[i].CanSpare == true
		{
			_c = c_yellow;
		}
	}
	if blb_UI_level != -1
	{
		draw_text_color(border_l + 50, border_u + 15, "* " + spare_op[0], _c, _c, _c, _c, 1);
		if mercy_pos == 0 
		{
			draw_sprite_ext(sprSoul, 0, border_l + 30,  border_u + 30, 1, 1, 0, c_white, 1 );
		}
		if array_length(spare_op) == 2
		{
			draw_text(border_l + 50, border_u + 50, "* " + spare_op[1]);
			if mercy_pos == 1
			{
				draw_sprite_ext(sprSoul, 0, border_l + 30,  border_u + 66, 1, 1, 0, c_white, 1 );
			}
		}
	}
	break;

}

if blb_UI_level == 1 || blb_UI_level == 2
{
	
	//Draws Monster HP bar
	for (var i = 0; i < monster_length; i++) 
	{
		if BMonsters[i].ShowHealthBar == true && !BMonsters[i].Defeated
		{
			var percent = (BMonsters[i].MonsterHP / BMonsters[i].MonsterMaxHP) * 100;
			draw_set_color(c_red);
			draw_rectangle(470, 263 + (35 * i), 570, 280 + (35 * i), false);
			draw_set_color(c_lime);
			draw_rectangle(470, 263 + (35 * i), 470 + percent, 280 + (35 * i), false);
		}
	}

}
if blb_UI_level != 0 && !battle_ended && !acting && !used_item {instance_destroy(objTextbox)};

//Draws HP bar
var hp_barwidth = global.Player.MaxHP * 1.6;
var hp_barwidth_fill = global.Player.HP * 1.6;
draw_set_color(c_red);
draw_rectangle(282, 395, 282 + hp_barwidth, 413, false);
draw_set_color(c_yellow);
draw_rectangle(282, 395, 282 + hp_barwidth_fill, 413, false);

//Draws player info
draw_set_font(fntBattleUIhp);
draw_set_color(c_white);
draw_text(38, 397, global.Player.Name + "   LV " + string(global.Player.LOVE));
draw_text(295 + hp_barwidth, 397,  string(global.Player.HP) + "/" + string(global.Player.MaxHP));

if fled && blb_UI_level == -1
{	
	draw_set_font(fntBig);
	draw_text_color(border_l + 60, border_u + 20, escape_text, c_white, c_white, c_white, c_white, 1);
}
