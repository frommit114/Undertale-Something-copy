//Inputs
start_left_key = input_check_pressed("left");
start_right_key = input_check_pressed("right");
start_confirm_key = input_check_pressed("confirm");

start_pos += start_left_key - start_right_key;

if start_pos >= array_length(start_options) {start_pos = 0};
if start_pos < 0 {start_pos = array_length(start_options) - 1};

if start_confirm_key
{
	switch(start_pos)
	{
		case 0 :
		LOAD();
		break;
	}
}
