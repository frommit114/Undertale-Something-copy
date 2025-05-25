function CreateMenu(_x = global.CameraX, _y = global.CameraY, _width = -1, _height = -1 ,_options, _description = -1, _type = 0, _bg_sprite = noone)
{	
	with( instance_create_depth(_x, _y, -15999, objMenu) )
	{
		width = _width;
		height = _height;
		options = _options;
		description = _description;
		menu_type = _type;
		bg_sprite = _bg_sprite;
		options_count = array_length(_options);
		options_margin = 10;
		hover_marker = sprSmallSoul;
		hover_sprite_offset = 2;
		
		margin = 10;
		draw_set_font(fntMenu);
		if _width == -1
		{
			width = 1;
			if (_description != -1) width = max(width, string_width(_description));
			for(var i = 0; i < options_count; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
				width += sprite_get_width(hover_marker) - 4; 
		}
		else
		{
			width = _width;
		}
		if height == -1
		{
			height_line = 17;
			height = height_line * (options_count + !(description == -1));
		
			width_full = width + margin * 2;
			height_full = height + margin * 2;
		}
		else
		{
			height = _height; 
			height_line = 17;
			width_full = width;
			height_full = height;
		}
	}
}

function CreateBattleMenu(_x = global.CameraX, _y = global.CameraY, _options, _description = -1)
{	
	if (!instance_exists(objBattleMenu))
	{
		with( instance_create_depth(_x, _y, -15999, objBattleMenu) )
		{
			options = _options;
			description = _description;
			options_count = array_length(_options);
			options_margin = 10;
			hover_marker = sprSoul;
			hover_sprite_offset = 2;
		
			margin = 10;
			draw_set_font(fntBig);
		
			width = 1;
			if (_description != -1) width = max(width, string_width(_description));
			for(var i = 0; i < options_count; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			width += sprite_get_width(hover_marker); 
		
			height_line = 17;
			height = height_line * (options_count + !(description == -1));
		
			width_full = width + margin * 2;
			height_full = height + margin * 2;
		}
	}
	else
	{
		instance_destroy(objBattleMenu)
	}
}

function CreateGameMenu()
{
	if (!instance_exists(objMenu))
	{
		CreateMenu
		(
		global.CameraX + GAME_MENU_OFFSET_X, 
		global.CameraY + GAME_MENU_OFFSET_Y,
		-1,
		-1,
		[
			["ITEM", CreateItemMenu],
			["STAT", -1],
			["SETTINGS", -1]
		],
		-1,
		1,
		sprBox
		)
	}
	else
	{
		instance_destroy(objGameMenu);
	}
}

function CreateItemMenu()
{
	CreateMenu(
	global.CameraX + GAME_MENU_OFFSET_X + 10,
	global.CameraY + GAME_MENU_OFFSET_Y,
	100,
	100,
	[
	],
	-1,
	0,
	sprBox
	)
}



