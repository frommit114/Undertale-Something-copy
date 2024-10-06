alpha = min(alpha+0.01, 1);

draw_set_alpha(alpha);
draw_sprite_ext(sprGameOver, 0, 120, 50, 1, 1, 0, c_white, alpha);
draw_set_alpha(1);

