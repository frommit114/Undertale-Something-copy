scrShopKeeperData();
shopkeeperitemdata();
shopkeepertextdata();
//parameters 
width = 640;
height = 242;

sh_box_x = 0;
sh_box_y = 238;

depth = -15998;



option_box_width = 210;
option_box_height = 242;

option_box_x = 430;

sh_desc_box_current_height = 40;
sh_desc_box_height = 100;

sh_op_border = 20;
sh_op_space = 43;

sh_option_x = 470;
sh_option_y = 242;

sh_item_x = 145;
sh_item_y = 240;
sh_item_space = 48;

sh_item_desc_current_y = 200;
sh_item_desc_y = 200;

sh_item_op_space = 32;

//posses for all submenus
sh_pos = 0;

sh_item_pos = 0;

sh_talk_pos = 0;

sh_item_op_pos = 0;

sh_exit_pos = 0;

sh_exit = false;
sh_buyed = false;

//Options 
sh_options[0] = "Buy";
sh_options[1] = "Sell";
sh_options[2] = "Talk";
sh_options[3] = "Exit";

sh_item_options[0] = "Yes";
sh_item_options[1] = "No";

sh_item_op_length = array_length(sh_item_options);
sh_op_length = array_length(sh_options);
sh_menu_level = 0;
sh_can_move = true;
shopkeeper = global.shpkdat.test;



