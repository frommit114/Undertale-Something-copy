global.InCutscene = false;

///@description CutsceneWait
///@arg seconds
function CutsceneWait()
{
	timer ++;
	if(timer>= argument0 * room_speed)
	{
		timer = 0;
		CutsceneEndAction();
	}
}

function CutsceneEndAction()
{
	scene++;
	if(scene > array_length(scene_info) -1)
	{
		instance_destroy();
		exit;
	}
	event_perform(ev_other, ev_user0);
}

///@arg soundid
///@arg priority
///@arg loops
function CutscenePlaySound()
{
	audio_play_sound(argument0, argument1, argument2);
	CutsceneEndAction();
}

///@arg x
///@arg y
///@arg layer_id
///@arg obj
function CutsceneInstanceCreate()
{
	var _inst = instance_create_layer(argument0, argument1, argument2, argument3);
	CutsceneEndAction();
	
	return _inst;
}

///@arg obj_id
function CutsceneInstanceDestroy()
{
	with(argument0)
	{
		 instance_destroy();
	}
	CutsceneEndAction();
}

///@arg x
///@arg y
///@arg obj
function CutsceneInstanceDestroyNearest()
{
	var _inst = instance_nearest(argument0, argument1, argument2);
	CutsceneInstanceDestroy(_inst);
}

///@arg obj_id
///@arg image_xscale
function CutsceneChangeXScale()
{
	var arg;
	var i = 0; repeat(argument_count)
	{
		arg[i] = argument[i];
		i++;
	}
	
	if argument_count > 1
	{
		 with(arg[0])
		 {
			  image_xscale = arg[1];
		 }
	}
	else
	{
		 with(arg[0])
		 {
			  image_xscale = -image_xscale;
		 }
	}
	CutsceneEndAction();
}

///@arg obj
///@arg var_name_as_string
///@arg value
function CutsceneChangeVariable()
{
	with(argument0)
	{
		variable_instance_set(id, argument1, argument2);
	}
	CutsceneEndAction();
}

///@arg obj
///@arg x
///@arg y
///@arg relative?
///@arg spd
function CutsceneMoveCharacter()
{
	var obj = argument0, relative = argument3, spd = argument4;
	if(x_dest == -1)
	{
		 if(!relative)
		 {
			  x_dest = argument1;
			  y_dest = argument2;
		 }
		 else
		 {
			  x_dest = obj.x + argument1;
			  y_dest = obj.y + argument2;
		 }
	}
	
	var xx = x_dest;
	var yy = y_dest;
	
	with(obj)
	{
		 if(point_distance(x, y, xx, yy) >= spd)
		 {
			  var dir = point_direction(x, y, xx, yy);
			  var ldirx = lengthdir_x(spd, dir);
			  var ldiry = lengthdir_y(spd, dir);
		 
			  x += ldirx;
			  y += ldiry;
		 }
		 else
		 {
			  x = xx;
			  y = yy;
			  
			  with(other)
			  {
				   x_dest = -1;
				   y_dest = -1;
				   CutsceneEndAction();
			  }
		 }
	}
}

///@arg x
///@arg y
///@arg relative?
///@arg spd
function CutsceneMoveCamera(argument0 = 0, argument1 = 0, argument2 = true, argument3 = 1)
{
	var target_x = argument0, target_y = argument1, relative = argument2, spd = argument3;
	with(objCamera2)
	{
		//set the follow variable back to noone, so the camera doesnt stays locked in the players postion
		follow = noone;
		camera_mode = CAMMODE.MOVETOTARGET;
		//if relative is true, move the camera by its x plus the amount specified
		if(relative)
		{
			moveto_target_x = camX + target_x;
			moveto_target_y = camY + target_y;
			//Set the camera smooth variable to the one specified in the speed argument
			CAM_SMOOTH = spd;
		}
		else // set the camera to a specif point in the room
		{
			camX = target_x;
			camY = target_y;
			CAM_SMOOTH = spd;
		}
	}
	CutsceneEndAction();
}

///@arg scene_info
function CreateCutscene()
{
	var inst = instance_create_layer(x, y, "Interactions", objCutscene);
	with(inst)
	{
		scene_info = argument0;
		event_perform(ev_other, ev_user0);
	}
	global.InCutscene = true;
}


function script_execute_alt()
{
	var s = argument0;
	var a = argument1;
	var len = array_length(argument1);
 
	switch(len){
    case 0 : script_execute(s); break;
    case 1 : script_execute(s, a[0]); break;
    case 2:  script_execute(s, a[0], a[1]); break;
    case 3:  script_execute(s, a[0], a[1], a[2]); break;
    case 4:  script_execute(s, a[0], a[1], a[2], a[3]); break;
    case 5:  script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
    case 6:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
    case 7:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
    case 8:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
    case 9:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
    case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
    case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
    case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
    case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
    case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
    case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
    }
}