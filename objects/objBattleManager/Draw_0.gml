//Borders for the bullet board
border_l = (320 + current_x_offset) - (current_width / 2);
border_r = (320 + current_x_offset) + (current_width / 2);
border_u = (380 + current_y_offset) - current_height;
border_d = (380 + current_y_offset);

draw_set_color(c_white);
draw_rectangle(border_l - 6, border_u - 6, border_r + 6, border_d + 6, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

draw_sprite(battle_background, 0, 0, 0);
