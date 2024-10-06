//Camera x and y
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

//Draws the box
draw_sprite_ext(sprite_index, image_index, vx + 100, vy + 20, width / sprite_width, height / sprite_height, 0, c_white, 1);

//draw the letters
draw_set_font(fntMain);
draw_set_valign(fa_top);
draw_set_valign(fa_left);
for (var i = 0; i < lt_length; i++)
{
	var _c = c_white
	if pos == i && (objGameMenu.menu_level == 1) && (submenu_level == 0) {_c = c_yellow}
    draw_text_color(vx + 110 + op_border, vy + 20 + op_border + op_space * i, letters[i], _c, _c, _c, _c, 1);
    if pos == i  && (objGameMenu.menu_level == 1) && (submenu_level == 0) {draw_sprite_ext(sprSmallSoul, 0, vx + 100 + op_border + 11, vy + 23 + op_border + op_space * i, 1, 1, 1, c_white, 1);}
}

//Draw the options
var _op_space = 49;
var _op_border = 2;
	
for (var lt_op = 0; lt_op < lt_op_length; lt_op++)
{
	var _c = c_white
	 if op_pos == lt_op && (objGameMenu.menu_level == 1) && (submenu_level == 1) {_c = c_yellow}
	 draw_text_color(vx + 70 + _op_space + _op_space*lt_op, vy + 147 + _op_border, lt_options[lt_op], _c, _c, _c, _c, 1);
	 if op_pos == lt_op  && (objGameMenu.menu_level == 1) && (submenu_level == 1) 
	 {
	   draw_sprite_ext(sprSmallSoul, 0, vx + 128 + _op_space + _op_space*lt_op, vy + 311 + _op_border , 1, 1, 1, c_white, 1);
	 }
}