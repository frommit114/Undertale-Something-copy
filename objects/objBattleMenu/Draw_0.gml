draw_set_font(fntBig);
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
		if bt_pos == l - _desc
		{
			var column = l div 2; // 3 columns
			var row = l mod 2;    // 2 rows
			draw_set_color(c_yellow);
			draw_sprite(sprSoul, 0, objBulletBoard.border_l + 30 + (row * 300), objBulletBoard.border_u + (column * 30) + 30 );
			_str = _str;
		}
		draw_text(objBulletBoard.border_l + 50 + (row * 300), objBulletBoard.border_u + (column * 30) + 15, "* " + _str)
	}
}
