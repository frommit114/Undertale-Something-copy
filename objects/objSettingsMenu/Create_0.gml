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
st_options[5] = "UI styles";
st_options[6] = "Reset to defult";
st_options[7] = "Back";

st_controls[0] = "UP:";
st_controls[1] = "DOWN:";
st_controls[2] = "LEFT:";
st_controls[3] = "RIGHT:";
st_controls[4] = "CONFIRM:";
st_controls[5] = "CANCEL:";
st_controls[6] = "MENU:";

st_bindings[0] = "up";
st_bindings[1] = "down";
st_bindings[2] = "left";
st_bindings[3] = "right";
st_bindings[4] = "confirm";
st_bindings[5] = "cancel";
st_bindings[6] = "menu";

st_control_pos = 0;
st_selected_bind = false;

st_checked_options[0] = objSettings.full_screen;
st_checked_options[1] = false;

st_op_length = array_length(st_options);
st_control_legth = array_length(st_controls);

full_screen = false;
