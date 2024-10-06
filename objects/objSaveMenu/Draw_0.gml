sv_menu_x = camera_get_view_x(view_camera[0]);
sv_menu_y = camera_get_view_y(view_camera[0]);

draw_set_font(fntMain)

draw_sprite_ext(sprite_index, image_index, sv_menu_x + 50, sv_menu_y + 40, sv_width / sprite_width, sv_height / sprite_height, 0, c_white, 1);

var _c = c_white;
if saved _c = c_yellow;
draw_text_color(sv_menu_x + sv_border + 20, sv_menu_y + sv_border + 5, global.Player.Name + "    LV" + string(global.SaveData.SaveLOVE) + "    time", _c, _c, _c, _c, 1);

var _c = c_white
if saved _c = c_yellow;
draw_text_color(sv_menu_x + sv_border + 20, sv_menu_y + sv_border + 30, global.SaveData.SaveZone + " - " + global.SaveData.SaveRoomName, _c, _c, _c, _c, 1)

for (var i = 0; i < sv_op_length; i++)
{
	var _c = c_white;
	if saved _c = c_yellow;
	draw_text_color(sv_menu_x + sv_border + 20 + (i * sv_space), sv_menu_y + sv_border + 55, sv_option[i], _c, _c, _c, _c, 1)

	if sv_pos == i && !saved
	{
		draw_sprite_ext(sprSmallSoul, 0, sv_menu_x + sv_border + 8 + (i * sv_space), sv_menu_y + sv_border + 58, 1, 1, 0, c_white, 1);
	}
}

if saved
{
	draw_text_color(sv_menu_x + sv_border + 20, sv_menu_y + sv_border + 43, "FILE SAVED", c_yellow, c_yellow, c_yellow, c_yellow, 1);
}

if saved && !played_audio
{
 audio_play_sound(sndSaved, 10, false);
 played_audio = true;
}