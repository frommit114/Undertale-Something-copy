draw_set_font(fntMainSmall)
if global.debug == true
{
	if instance_exists(objPlayer)
	{
		draw_text(0,0,"x" + "=" + string(global.Player.X))
		draw_text(0,20, "y" + "=" +  string(global.Player.Y))
		draw_text(0, 42, "last x" + "=" + string(objPlayer.last_x))
		draw_text(0, 60, "last y" + "="+ string(objPlayer.last_y))
		draw_text(0,80, "face" + "=" + string(objPlayer.face))
		draw_text(0, 140, "can move" + "=" +  string(objPlayer.can_move))
	}
	draw_text(0, 100, "current rm " + room_get_name(room))
	draw_text(0, 120, "last rm " + room_get_name(global.Player.LastRoom))
	draw_text(400, 0, "camera x:" + string(objCamera.camX));
	draw_text(400, 20, "camera y:" + string(objCamera.camY));
}
