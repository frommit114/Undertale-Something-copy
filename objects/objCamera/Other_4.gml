view_enabled = true;
view_visible[0] = true;

// Create camera
if room != (rmBattle || rmGameOver)
{
	camera = camera_create_view(0, 0, RES_W, RES_H);
}
else if room == (rmBattle || rmGameOver) 
{
	camera = camera_create_view(0, 0, 640, 480);
}

view_set_camera(0, camera);
