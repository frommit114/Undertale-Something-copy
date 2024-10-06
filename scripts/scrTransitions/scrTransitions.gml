global.MidTransition = false;
global.RoomTarget = -1;
global.Player_x = 0;
global.Player_y = 0;


function TransitionPlaceSequence(_type)
{

	if (layer_exists("Transition")) layer_destroy("Transition");
	var _lay = layer_create(-16000, "Transition");
	layer_sequence_create(_lay, 0, 0, _type);

}

function TransitionStart(_roomTarget, _typeOut, _typeIn, _x, _y)
{

	if (!global.MidTransition)
	{
	
	global.MidTransition = true;
	global.RoomTarget = _roomTarget;
	if instance_exists(objPlayer)
	{
	objPlayer.can_move = false;
		if _x && _y != 0
		{
			global.Player_x = _x
			global.Player_y = _y
		}
	}
	TransitionPlaceSequence(_typeOut);
	layer_set_target_room(_roomTarget);
	TransitionPlaceSequence(_typeIn);
	layer_reset_target_room();
	return true;
	}
	else return false;

}



function TransitionChangeRoom()
{

room_goto(global.RoomTarget);
	if instance_exists(objPlayer)
	{
		if instance_exists(objWarpBlock) && (global.RoomTarget != rmBattle || rmStore)
		{
			objPlayer.x = objWarpBlock.target_x;
			objPlayer.y = objWarpBlock.target_y;
		}
		else
		{
			objPlayer.x = global.Player_x
			objPlayer.y = global.Player_y
		}
		if global.RoomTarget != rmBattle || rmStore
		{
			objPlayer.can_move = true;
		}
	}
}

function TransitionFinished()
{

layer_sequence_destroy(self.elementID);
global.MidTransition = false;

}
