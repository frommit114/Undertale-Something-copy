//Camera x and y
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

//Draws the box
draw_sprite_ext(sprite_index, image_index, vx + 100, vy + 20, width / sprite_width, height / sprite_height, 0, c_white, 1);

//Draws the name
draw_set_font(fntMain);
draw_text(vx + 110, vy + 32, global.Player.Name);

//Draws HP and LV
draw_set_font(fntMain);
draw_text(vx + 110, vy + 67, "LV " + string(global.Player.LOVE));
draw_text(vx + 110, vy + 82, "HP " + string(global.Player.HP) + "/" + string(global.Player.MaxHP));

//Draws AT, DF and EXP
draw_text(vx + 110, vy + 112, "AT " + "(" + (string(global.Player.ATK)) + ")");
draw_text(vx + 110, vy + 129, "DF "  + "(" + (string(global.Player.DEF)) + ")");
draw_text(vx + 180, vy + 112, "EXP:"  + (string(global.Player.EXP)));
draw_text(vx + 180, vy + 127, "NEXT:" + string(global.Player.NextLVEXP));

//Draws weapon, armor and gold
draw_text(vx + 110, vy + 162, "WEAPON:" + global.Player.Weapon.item_name);
draw_text(vx + 110, vy + 179, "ARMOR:" + global.Player.Armor.item_name);
draw_text(vx + 110, vy + 200, "GOLD:" + string(global.Player.Gold));