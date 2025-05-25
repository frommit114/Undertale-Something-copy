if bg_sprite != noone
{
	draw_sprite_stretched(bg_sprite, 0, x - margin, y - margin, width_full, height_full);
}

draw_set_font(fntMenu);
draw_set_color(c_white);

var _desc = !(description == -1);

for( l = 0; l < (options_count + _desc); l++)
{
	draw_set_color(c_white);
	if (l == 0) && (_desc)
	{
		draw_text(x, y, _desc);
	}
	else 
	{
		var _str = options[l - _desc][0]
		if op_pos == l - _desc
		{
			draw_set_color(c_yellow);
			draw_sprite(hover_marker, 0, x - hover_sprite_offset, y + hover_sprite_offset + 1 + l * height_line);
			_str = _str;
		}
		draw_text(x + options_margin, y + l * height_line, _str);
	}
}

switch(menu_type)
{
	case 0:
	break;
	
	case 1:
	//Draw box for player info
	draw_sprite_stretched(sprBox, 0, x - 10, y - 75, width_full, 60);
	//Player info
	draw_set_color(c_white);
	draw_text(x, y - 68, global.Player.Name);
	draw_set_font(fntMini);
	draw_text(x, y - 50, "LV:   " + string(global.Player.LOVE));
	draw_text(x, y - 40, "HP:  " + string(global.Player.HP) + "/" + string(global.Player.MaxHP));
	draw_text(x, y - 30, "G:    " + string(global.Player.Gold));
	break;
}