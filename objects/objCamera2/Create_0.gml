//Resolution
#macro RES_W 320
#macro RES_H 240
#macro RES_SCALE 2

CAM_SMOOTH = 1

// Enable views
view_enabled = true;
view_visible[0] = true;

// Create camera
camera = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, camera);

//Object to follow
follow = noone;

//Camera mode
enum CAMMODE
{
	FOLLOW,
	PANNING,
	FREE,
	MOVETOTARGET,
}
camera_mode = 0;

//camera move to cordinates
moveto_target_x = 0;
moveto_target_y = 0;

// Resize window & application surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W, RES_H);

// Center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

//Screen shake
shake_power = 5;
shake_value = 0;
