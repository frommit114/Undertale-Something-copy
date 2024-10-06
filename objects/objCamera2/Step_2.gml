// Get current camera position
camX = camera_get_view_x(camera);
camY = camera_get_view_y(camera);
camW = camera_get_view_width(camera);
camH = camera_get_view_height(camera);


switch(camera_mode)
{
	//Follow object
	case CAMMODE.FOLLOW :
	if (!instance_exists(follow)) break;
	// Set target camera position
	var targetX = follow.x - camW/2;
	var targetY = follow.y - camH/2;

	// Clamp the target to room bounds
	targetX = clamp(targetX, 0, room_width - camW);
	targetY = clamp(targetY, 0, room_height - camH);

	// Smoothly move the camera to the target position
	camX = lerp(camX, targetX, CAM_SMOOTH);
	camY = lerp(camY, targetY, CAM_SMOOTH);	
	break;
	
	// Panning
	case CAMMODE.PANNING :
	if (mouse_check_button(mb_right)) 
	{
		var move_x = device_mouse_x_to_gui(0) - mouse_x_previous;
		var move_y = device_mouse_y_to_gui(0) - mouse_y_previous;
	
		camX -= move_x;
		camY -= move_y;
	}
	break;
	
	case CAMMODE.FREE :
	break;
	
	case CAMMODE.MOVETOTARGET :
	// Set target camera position
	var targetX = moveto_target_x - camW/2;
	var targetY = moveto_target_y - camH/2;

	// Clamp the target to room bounds
	targetX = clamp(targetX, 0, room_width - camW);
	targetY = clamp(targetY, 0, room_height - camH);

	// Smoothly move the camera to the target position
	camX = lerp(camX, targetX, CAM_SMOOTH);
	camY = lerp(camY, targetY, CAM_SMOOTH);	
	break;
	
	
}


// Zooming
var wheel = mouse_wheel_down() - mouse_wheel_up();

if (wheel != 0) 
{
	wheel *= 0.1;
	
	// Add to size
	var addW = camW * wheel;
	var addH = camH * wheel;
	
	camW += addW;
	camH += addH;
	
	// Position
	camX -= addW / 2;
	camY -= addH / 2;
}

var shake = power(shake_value, 2) * shake_power;
camX += random_range(-shake, shake);
camY += random_range(-shake, shake);

// Apply camera position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

//Store previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);

if (shake_value > 0) shake_value -=0.1;
