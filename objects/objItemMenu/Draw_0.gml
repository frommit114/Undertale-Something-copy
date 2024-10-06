//Camera x and y
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

//Draws the box
draw_sprite_ext(sprite_index, image_index, vx + 100, vy + 20, width / sprite_width, height / sprite_height, 0, c_white, 1);

draw_set_font(fntMain)
for (var i = 0; i < array_length(objItemManager.inv); i++)
{
	var _c = c_white
	if item_pos == i && (objGameMenu.menu_level == 1) && (submenu_level == 0) {_c = c_yellow}
    draw_text_color(vx + 110 + item_border, vy + 22 + item_border + item_space*i, objItemManager.inv[i].item_name, _c, _c, _c, _c, 1);
	if item_pos == i  && (objGameMenu.menu_level == 1) && (submenu_level == 0) {draw_sprite_ext(sprSmallSoul, 0, vx + 89 + item_border + 11, vy + 25 + item_border + item_space * i, 1, 1, 1, c_white, 1);}
}

//Draw the options
var _op_space = 49;
var _op_border = 2;
	
for (var item_op = 0; item_op < array_length(item_options); item_op++)
{
	var _c = c_white
	if op_pos == item_op && (objGameMenu.menu_level == 1) && (submenu_level == 1) {_c = c_yellow}
    draw_text_color(vx + 70 + _op_space + (_op_space*item_op), vy + 190 + _op_border, item_options[item_op], _c, _c, _c, _c, 1);
    if op_pos == item_op  && (objGameMenu.menu_level == 1) && (submenu_level == 1) 
    {
	   draw_sprite_ext(sprSmallSoul, 0, vx + 60 + _op_space + _op_space*item_op, vy + 194 + _op_border , 1, 1, 1, c_white, 1);
    }
}