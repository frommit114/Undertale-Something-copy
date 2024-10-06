sv_width = 225;
sv_height = 90;

sv_border = 50;
sv_space = 100;

sv_pos = 0;

sv_option[0] = "Save";
sv_option[1] = "Return";

saved = false;
played_audio = false;

sv_op_length = array_length(sv_option);

objPlayer.can_move = false;
audio_play_sound(sndMenuMove, 5, false);