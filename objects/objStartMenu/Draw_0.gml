draw_set_font(fntMain);

draw_text(75, 60, global.Player.Name + "    LV" + string(global.SaveData.SaveLOVE) + "    time");


for(var i = 0; i < array_length(start_options); i++)
{
	var _c = c_white;
	if start_pos == i { _c = c_yellow; }
	draw_text_color(90 * (i + 1), 100, start_options[i], _c, _c, _c, _c, 1);
}

draw_set_font(fntMini)
draw_text_color(100, 230, "UNDERTALE SOMETHING " + "V" + GM_version, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
