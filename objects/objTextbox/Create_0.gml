//Textbox parameters
textbox_width = 555 / 2;
textbox_height = 155 / 2;
border = 5;
line_sep = 20;
line_width = textbox_width - border * 2;
txtb_spr[0] = sprBox;
txtb_img = 0;
txtb_img_spd =1/60;


//The text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
can_advance = true;
can_skip = true;

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_spd = 1;

shake_timer_min = 4;
shake_timer_max = 8;


//Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;
 
 
//sound
sound_timer = 1;
sound_count = sound_timer;
 
 
//efects
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 20;
text_x_offset[page] = 0;


enum CALLTYPE
{
	INTERACTIONBOX,
	NPC,
	CUTSCENE,
	BATTLEDIALOGUE,
	BATTLEITEM,
	BATTLEACT,
	GAMEMENU,
	SHOPDIALOGUE,
}

call_type = 0;


//toggle player movement
if (instance_exists(objPlayer))
{
	objPlayer.can_move = false
}

is_typing = false
