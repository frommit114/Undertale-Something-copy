if array_length(objItemManager.inv) == 0
{
button_available = false;
}

//Draw the buttons
for (var b = 0; b < button_length; b++)
{

	var _indx = image_index = 0;
	if button_pos == b && UI_level == 0 {_indx = 1}
    draw_sprite_ext(button[b], _indx, button_x + button_space*b, button_y,1, 1, 0, c_white, 1);
	if button_pos == b && UI_level == 0
    {
	   draw_sprite_ext(sprSoul, 0, button_x + button_space*b + 16, button_y + 20, 1, 1, 0, c_white, 1);
    }
}