function scr_set_defaults_for_text() 
{
	
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;

	
	//Variables for every letter
	
	for (var c = 0; c < 500; c++)
	{
		
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
	
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
	
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	
		break_line[c, page_number] = 0;
	
	}
	
	txtb_spr[page_number] = sprBox;
	snd[page_number] = sndTextnormal;
	speaker_sprite[page_number] = noone;
	txtb_color[page_number] = c_white;
	position[page_number] = noone;
	textbox_font[page_number] = fntMain;
	
}

//-----------------VFX-------------------//
/// @param 1st_char
/// @param last_char
/// @param col_1
/// @param col_2
/// @param col_3
/// @param col_4
function scr_text_color(_start, _end, _col_1, _col_2, _col_3, _col_4)
{
	for (var c = _start; c <= _end; c++)
	{
		col_1[c, page_number-1] = _col_1;
		col_2[c, page_number-1] = _col_2;
		col_3[c, page_number-1] = _col_3;
		col_4[c, page_number-1] = _col_4;
	}
}

/// @param 1st_char
/// @param last_char
function scr_float_text(_start, _end)
{
	for (var c = _start; c <= _end; c++)
	{
		 float_text[c, page_number -1] = true;
	}		
}

/// @param 1st_char
/// @param last_char
function scr_shake_text(_start, _end, _shake_timer_min = 4, _shake_timer_max = 8)
{
	for (var c = _start; c <= _end; c++)
	{
		 shake_text[c, page_number -1] = true;
		 shake_timer_min = _shake_timer_min;
		 shake_timer_max = _shake_timer_max;
	}		
}

/// @param 1st_char
/// @param last_char
function scr_break_line(_start, _end)
{

	for (var c = _start; c <= _end; c++) 
	{

		break_line[c, page_number -1] = true;
		
	}

}

/// @param 1st_char
/// @param last_char
/// @param text_speed
function scr_text_speed(_start, _end, _speed, _sound_delay)
{

		for (var c = _start; c <= _end; c++) 
	{

		objTextbox.text_spd = _speed
		objTextbox.sound_delay = _sound_delay
	}

}


/// @param text
/// @param [character]
/// @param [box_color]
/// @param [position]
/// @param [can_advance]
/// @param [can_skip]
/// @param [font]
function scr_text(_text) 
{

	scr_set_defaults_for_text();
	
	text[page_number] = _text;
	
	//get character info
	if argument_count > 1 
	{
	switch (argument[1]) 
		{
		
		case "Sans" :
		speaker_sprite[page_number] = sprTestPortrait;
		snd[page_number] = sndTextSans;
		break;
		
		case "Battle Text" :
		snd[page_number] = sndTextBattle;
		break;
		
		}
	}
	
	//Custom box color. or no box... if you want
	if argument_count > 2 
	{
		if argument[2] != "No box"
		{
			txtb_color[page_number] = argument[2]	
		}
		else if argument[2] == "No box"
		{
			txtb_color[page_number] = noone;
		}
	}

	//Box and text postion. 
    if argument_count > 3 
    {
		position[page_number] = argument[3]	
    }
  
    //Can advance and skip
    if argument_count > 4 
    {
	     can_advance = argument[4]
    }
  
    if argument_count > 5
    {
	     can_skip = argument[5]
    }
  
    //Textbox font
    if argument_count > 6
    {
	     textbox_font[page_number] = argument[6] 
    }
  
    if argument_count > 7
    {
		 objTextbox.shake_timer_min = argument[7]
    }
	
	if argument_count > 8
	{
		 objTextbox.shake_timer_max = argument[8]
	}
  

	page_number ++;

}

/// @param option
/// @param link_id
function scr_option(_option, _link_id) 
{

	option[option_number] = _option;
	option_link_id[option_number] = _link_id;

	option_number++;

}

/// @param text_id
function create_textbox(_text_id) 
{
	if !instance_exists(objTextbox)
	{
	with (instance_create_depth(0, 0, -15999, objTextbox))
	        {
				scrGameText(_text_id);
			}
	}
}