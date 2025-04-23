var _up_key = input_check_pressed("up");
var _down_key = input_check_pressed("down");

op_pos += _down_key - _up_key;

if (op_pos > options_count - 1) op_pos = 0;
if (op_pos < 0) op_pos = options_count-1;

if last_pos != op_pos
{
	audio_play_sound(sndMenuMove, 1, false);
}

if input_check_pressed("confirm")
{
	if array_length(options[op_pos] == 2)
	{
		var _func = options[op_pos][1];
		if (_func != -1) _func();
	}
	instance_destroy();
}
