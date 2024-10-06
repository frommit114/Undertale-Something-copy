//Camera x and y
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

height = op_border*2 + font_get_size(fntMenu) + (op_length-1)*op_space

if objPlayer.y - 300 >= vy 
{
	menu_position = "Bottom"
}


if menu_position == "Bottom"
{
	vy = camera_get_view_y(view_camera[0]) + 10;
}

if instance_exists (objTextbox) && objTextbox.position[objTextbox.page] == "Top"
{
	menu_position = "Bottom"
	if !instance_exists(objTextbox)
	{
	menu_position = "Top"
	}
}

//Draws the box
draw_sprite_ext(sprite_index, image_index, vx + 20, vy + 83, width / sprite_width, height / sprite_height, 0, c_white, 1);

//draw options
draw_set_font(fntMenu);
draw_set_valign(fa_top);
draw_set_valign(fa_left);
for (var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if pos == i && (menu_level == 0) {_c = c_yellow}
    draw_text_color(vx + op_x + op_border, vy + op_y + op_border + op_space * i, options[i], _c, _c, _c, _c, 1);
    if pos == i  && (menu_level == 0) {draw_sprite_ext(sprSmallSoul, 0, vx + 17 + op_border, vy + op_y + op_border + op_space * i + 3, 1, 1, 0, c_white, 1);}
}

//Player info box
if menu_position = "Top"
{
draw_sprite_stretched(sprBox, 0, vx + 20, vy + 20 , width,  60 );
}
if menu_position = "Bottom"
{
draw_sprite_stretched(sprBox, 0, vx + 20, vy + 155, width, 60);
}

//Player info
//Draw name
draw_set_font(fntMain);
draw_set_color(c_white);
if menu_position = "Top"
{
draw_text(vx + 27, vy + 26, global.Player.Name);

//Draw gold, exp and hp
draw_set_font(fntMini);
draw_text(vx + 28, vy + 46, "LV:   " + string(global.Player.LOVE));
draw_text(vx + 28, vy + 56, "HP:  " + string(global.Player.HP) + "/" + string(global.Player.MaxHP));
draw_text(vx + 28, vy +66, "G:    " + string(global.Player.Gold));
}

if menu_position = "Bottom"
{
draw_text(vx + 27, vy + 160, "Nadine");

//Draw gold, exp and hp
draw_set_font(fntMini);
draw_text(vx + 28, vy + 179, "LV:   " + string(global.Player.LOVE));
draw_text(vx + 28, vy + 189, "HP:  " + string(global.Player.HP) + "/" + string(global.Player.MaxHP));
draw_text(vx + 28, vy + 199, "G:    " + string(global.Player.Gold));
}