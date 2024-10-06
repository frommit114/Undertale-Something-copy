accept_key = keyboard_check_pressed(ord("Z"));
skip_key = keyboard_check_pressed(ord("X"));

textbox_x = camera_get_view_x( view_camera[0] );


switch ( position[page] )
{

	case noone :
	textbox_y = camera_get_view_y( view_camera[0] ) + 160;
	break;
	
	case "Top" :
	textbox_y = camera_get_view_y( view_camera[0] ) + 10;
	break;
	
	case "Shop" :
	textbox_y = camera_get_view_y( view_camera[0] ) + 240;
	textbox_x = camera_get_view_x( view_camera[0] ) - 35;
	break;
	
	case "Shop - buy" :
	textbox_y = camera_get_view_y( view_camera[0] ) + 240;
	textbox_x = camera_get_view_x( view_camera[0] ) + 380;
	break;
	
	case "Battle" :
	textbox_y = camera_get_view_y( view_camera[0] ) + 230;
	break;

}



if instance_exists(objPlayer) && objPlayer.y + 30 >= textbox_y && room != rmBattle
{
textbox_y = camera_get_view_y( view_camera[0] ) + 10;
}


//--------------------------Setup--------------------------//
if setup == false 
		{

		 setup = true;
         draw_set_font(fntMain);
		 draw_set_valign(fa_top);
		 draw_set_halign(fa_left);
		 
		 //loop through pages
		 for (var p = 0; p < page_number; p++)
		 {
			 
		 //Find how may characters are on each page and store that number in the "text_length" array
		 text_length[p] = string_length(text[p])		
		 
		 //get the x position for the textbox
			//no character (center)
		if speaker_sprite[p] = noone
		{
		 text_x_offset[p] = 60;
		}
		 //with character portrait (to the right)
		 text_x_offset[p] = 20;
		 portait_x_offset[p] = 38;
		 
		 //setting individual characters and finding where the lines of text should break
		 for (var c = 0;  c < text_length[p]; c++) 
		 {
		 var _char_pos = c+1;
		 
		 //store individual characters in the "char" array
		 char[c, p] = string_char_at(text[p], _char_pos);
		 
		 //get current width of the line
		 var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
		 var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
		 
		 //get the last free space
		 if char[c, p] == " " { last_free_space = _char_pos+1  }
		 
	     // get the line breaks
		if _current_txt_w - line_break_offset[p] > line_width or break_line[c,p] == true
		{ 
			
		line_break_pos[ line_break_num[p] , p ] = last_free_space;
		line_break_num[p]++;
		var _txt_up_to_last_space = string_copy( text[p], 1, last_free_space);
		var _last_free_space_string = string_char_at( text[p], last_free_space );
		line_break_offset[p] = string_width( _txt_up_to_last_space ) - string_width (_last_free_space_string );
		
			}
		}
		 
		 //getting each characters cordinates
		 for (var c = 0;  c < text_length[p]; c++) 
			{
		      var _char_pos = c+1;
			  var _txt_x = textbox_x + text_x_offset[p] + border;
			  var _txt_y = textbox_y + border;
			  //get current width of the line
			  var _txt_up_to_char = string_copy(text[p] , 1 , _char_pos);
			  var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			  var _txt_line = 0;
			  
			  //compensate for string breaks
			  for (var lb = 0; lb < line_break_num[p]; lb++)
					{
					//if the current looping character is after a line break
					if _char_pos >= line_break_pos[lb, p] 
						{
						var _str_copy = string_copy(text[p] ,  line_break_pos[lb, p] , _char_pos - line_break_pos[lb , p]);
						_current_txt_w = string_width(_str_copy);
						
						//record the line this character should be on
						_txt_line = lb+1;
						}
					}
			  //add to the x and y cordinates based on the new info
			  char_x[c, p] = _txt_x +  _current_txt_w;
			  char_y[c, p] = _txt_y + _txt_line * line_sep;
		 
			}
		 
		 
		 }
		 
	}

//--------------------------typing the text--------------------------//
if text_pause_timer <= 0 
{
if draw_char < text_length[page]
		{
		 draw_char += text_spd;
		 draw_char = clamp(draw_char, 0, text_length[page]);
		 var _check_char = string_char_at(text[page], draw_char)
		 if _check_char == "." || _check_char == "?"
		 {
		 text_pause_time = 20;
		 text_pause_timer = text_pause_time;
		 if !audio_is_playing(snd[page]) && _check_char != " " || _check_char != "," || _check_char != "*" {
			 audio_stop_sound(snd[page])
		 audio_play_sound(snd[page], 8, false)
			}	
		 }
		  else 
			{
			 //typing sound
				
				if sound_count < sound_delay 
				{ 
					sound_count ++;
				}
			  else 
			  {
				sound_count = 0;
				audio_play_sound(snd[page], 8, false)
			  }
				
			}
		 var _check_char = string_char_at(text[page], draw_char)
		 if _check_char == "," {
		 text_pause_time = 12;
		 text_pause_timer = text_pause_time;
		 }
		}
}  
	else 
	{
	text_pause_timer --;
	}
//--------------------------flip through the pages--------------------------//

if accept_key && can_advance == true
	{
		
     //if typing is done 
	 if draw_char == text_length[page]
	 {
		 
	       //next page
		  if page < page_number-1 
		  {
		   page ++;
		   draw_char = 0; 
		  }
		  
		 //destroy the textbox
		   else 
		   { 
			   //link text for options
			   if option_number > 0 
			   {
			   create_textbox(option_link_id[option_pos])
			   }
			 instance_destroy();
			 if instance_exists(objPlayer)
			 {
			 objPlayer.can_move = true;
			 }
		   }   
	 }

}

 //if not done typing
 if  draw_char != text_length[page] && skip_key && can_skip
     {
	 draw_char = text_length[page]
	 }

//--------------------------Draw the textbox--------------------------//
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//back of the textbox

if txtb_color[page] != noone
{
draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + text_x_offset[page], textbox_y, textbox_width / txtb_spr_w, textbox_height / txtb_spr_h, 0, txtb_color[page], 1);
}
else if txtb_color[page] == noone
{}

	
//draw the speaker
if speaker_sprite[page] != noone 
	{
	  sprite_index = speaker_sprite[page];
	  var _speaker_x = textbox_x + portait_x_offset[page];
	  draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y + 15, 1, 1, 0, c_white, 1)
	}

//--------------------------options--------------------------//
if draw_char == text_length[page] && (page == page_number - 1)
{
	
	//option selection
	option_pos += input_check_pressed("right") - input_check_pressed("left");
	if option_pos < 0 { option_pos = option_number - 1; }
	if option_pos >= option_number { option_pos = 0 }
	
	//draw the options
	var _op_space = 140;
	var _op_border = 2;
	draw_set_font(textbox_font[page])
	
	for (var op = 0; op < option_number; op++) 
		{
			//draw option text
			draw_text(textbox_x - 205 + _op_space*option_number + _op_space*op, textbox_y + 50 + _op_border, option[op]);
			
			//draw the soul
			if option_pos == op
			{
			   draw_sprite(sprSmallSoul, 0, textbox_x - 216 + _op_space*option_number + _op_space*op, textbox_y + 53 + _op_border);
			}
			//sounds
			if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left)
			{
				audio_play_sound(sndMenuMove, 1, false);
			}
			if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))
			{
				audio_play_sound(sndSelect, 1, false);
			}
		}
}

//draw the text
draw_set_font(textbox_font[page]);
for (var c = 0; c < draw_char; c++)
	{
		
		//--------special stuff--------//
		//wave text
		var _float_y = 0;
		if float_text[c, page] == true
			{
			float_dir[c, page] += -8;
			_float_y = dsin( float_dir[c, page] )*2;
			}
		//Shake text
		var _shake_x = 0;
		var _shake_y = 0;
		if shake_text[c, page] == true
		{
		shake_timer[c, page] --;
			if shake_timer[c, page] <= 2
			{
			shake_timer[c, page] = irandom_range(shake_timer_min, shake_timer_max);
			shake_dir[c, page] = irandom(360);
			_shake_x = lengthdir_x(1, shake_dir[c, page]*1.5);
		    _shake_y = lengthdir_y(1, shake_dir[c, page]*1.5);		
			}	
		}
		
	//The t e x t
	if position[page] == "Top"
	{
		char_y[c, page] = textbox_y + border;
	}
	if speaker_sprite[page] == noone
	{
		draw_set_font(textbox_font[page]);
		draw_text_color(char_x[c, page] + 10 + _shake_x, char_y[c, page] + border + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
	}
	if speaker_sprite[page] != noone
	{
		draw_set_font(textbox_font[page])
		draw_text_color(char_x[c, page] + 60 + _shake_x, char_y[c, page] + border + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
	}

}