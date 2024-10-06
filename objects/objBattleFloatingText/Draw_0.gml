draw_set_font(font);
draw_set_color(col);
draw_text(x, y, text);

draw_set_color(c_dkgrey);
draw_rectangle(_x - (bar_width / 2), _y + 10, _x + (bar_width / 2), _y + 24, false);
draw_set_color(c_lime);
draw_rectangle(_x - (bar_width / 2), _y + 10, _x - (bar_width / 2) + ((target_hp / target_max_hp) * bar_width), _y + 24, false);