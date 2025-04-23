var _up_key = input_check_pressed("up");
var _down_key = input_check_pressed("down");
var _left_key = input_check_pressed("left");
var _right_key = input_check_pressed("right");

if (_up_key) 
{
    bt_pos = (bt_pos - 2 + total_options) mod total_options; // Move up
}

if (_down_key) 
{
    bt_pos = (bt_pos + 2) mod total_options; // Move down
}

if (_left_key) 
{
    bt_pos = (bt_pos - 1 + total_options) mod total_options; // Move left
}

if (_right_key) 
{
    bt_pos = (bt_pos + 1) mod total_options; // Move right
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
