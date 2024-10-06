current_x = x;
current_y = y;

global.Player.X = current_x;
global.Player.Y = current_y;

//Inputs
up_key = input_check("up");
down_key = input_check("down");
right_key = input_check("right");
left_key = input_check("left");



if room == rmStore || room == rmStartMenu || room == rmBattle || room == rmGameOver
{
	visible = false;
	can_move = false;
}


if (can_move == true) 
{
	//Move player
	xspd = (right_key - left_key) * move_spd;
	yspd = (down_key - up_key) * move_spd;

}
else if can_move == false
{
	xspd = 0
	yspd = 0
}

//Step count and check for enemies
if xspd || yspd != 0
{
step_count ++;
CheckSteps(420);
}

//set sprite
mask_index = sprite[DOWN];
if yspd == 0 
{
	if xspd > 0 {face = RIGHT}
	if xspd < 0 {face = LEFT}
}

if xspd > 0 && face == LEFT {face = RIGHT}
if xspd < 0 && face == RIGHT {face = LEFT}

if xspd == 0
{
	if yspd > 0 {face = DOWN}
	if yspd < 0 {face = UP}
}

if yspd > 0 && face == UP {face = DOWN}
if yspd < 0 && face == DOWN {face = UP}
sprite_index = sprite[face];


//Collisions 
		//x collision
		if place_meeting(x + xspd, y, objWall)
		{
			xspd = 0;
		}
		//y collision
		if place_meeting(x, y + yspd, objWall)
		{
			yspd = 0;
		}

		
x += xspd;
y += yspd;


//animate. will improve later
if xspd == 0 && yspd == 0
{
		image_index = 0;
}


//Reset interaction box alarm
if alarm[0] == -1
{
	alarm[0] = 45;
}


//Check players face direction and create the interction box accordingly 
if input_check_pressed("confirm") && can_move == true
{
	switch(face)
	{
		case DOWN:
		instance_create_depth(objPlayer.x + 1, objPlayer.y + 18, -99999, objPlayerInteractionBox)
		break;
	
		case UP:
		instance_create_depth(objPlayer.x + 1, objPlayer.y - 4, -99999, objPlayerInteractionBox)
		break;
	
		case LEFT:
		instance_create_depth(objPlayer.x - 10, objPlayer.y + 13, -99999, objPlayerInteractionBox)
		objPlayerInteractionBox.image_angle = 90
		objPlayerInteractionBox.image_xscale = 0.6
		break;
	
		case RIGHT:
		instance_create_depth(objPlayer.x + 10, objPlayer.y + 13, -99999, objPlayerInteractionBox)
		objPlayerInteractionBox.image_angle = 90
		objPlayerInteractionBox.image_xscale = 0.6
		break;
	}
}


