//Params
st_width = 185;
st_height = 200;


st_op_space = 20;
st_border = 20;
st_op_x = 100;
st_op_y = 20;

st_sprite = sprBox;

st_pos = 0;
st_selected_op = false;
st_selected_audio_group = noone;

st_can_move = true;
st_menu_level = 0;


st_options[0] = "Music vol.";
st_options[1] = "SFX vol.";
st_options[2] = "Fullscreen";
st_options[3] = "Auto-Run";
st_options[4] = "Controls";
st_options[5] = "Reset to defult";
st_options[6] = "Back";

st_checked_options[0] = objSettings.full_screen;
st_checked_options[1] = false;

st_op_length = array_length(st_options);

full_screen = false;
