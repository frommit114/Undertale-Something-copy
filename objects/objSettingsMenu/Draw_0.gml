//Camera x and y
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);


draw_sprite_ext(sprite_index, image_index, vx + 100, vy + 20, st_width / sprite_width, st_height / sprite_height, 0, c_white, 1);

draw_set_font(fntMenu);
//Draw the options
for (var op = 0; op < st_op_length; op++)
{

	var _c = c_white
	if st_pos == op {_c = c_yellow}
	draw_text_color(vx + st_op_x + st_border, vy + st_op_y + st_border + (st_op_space*op), st_options[op], _c, _c, _c, _c, 1);
	if st_pos == op
	{
		draw_sprite(sprSmallSoul, 0, vx + st_op_x - 12 + st_border, vy + st_op_y + st_border + (st_op_space*op) + 3);
	}

}

for (var c = 0; c < array_length(st_checked_options); c++)
{
	
	var _indx = image_index = 0;
	if st_checked_options[c] {_indx = 1;}
    draw_sprite_ext(sprCheckBox, _indx, vx + st_op_x + 100, vy + st_op_y*(c+2) + 40,1, 1, 0, c_white, 1);

}

//Draw volume bar and percent
var _sfx_percent = global.sfx_volume * 100;
draw_set_color(c_grey);
draw_rectangle(vx + st_op_x + 80, vy + st_op_y + 42, vx + st_op_x + 140, vy + st_op_y + 52, false);
draw_set_color(c_white);
draw_rectangle(vx + st_op_x + 80, vy + st_op_y + 42, vx + st_op_x + 78.5 + _sfx_percent / 3.25, vy + st_op_y + 52, false);
draw_text(vx + st_op_x + 150, vy + st_op_y + 40, string(floor(global.sfx_volume * 100)) + "%");

//Music 
var _mus_percent = global.music_volume * 100;
draw_set_color(c_grey);
draw_rectangle(vx + st_op_x + 85, vy + st_op_y + 22, vx + st_op_x + 145, vy + st_op_y + 32, false);
draw_set_color(c_white);
draw_rectangle(vx + st_op_x + 85, vy + st_op_y + 22, vx + st_op_x + 83.5 + _mus_percent / 3.25, vy + st_op_y + 32, false);
draw_text(vx + st_op_x + 150, vy + st_op_y + 20, string(floor(global.music_volume * 100)) + "%")
	
	
