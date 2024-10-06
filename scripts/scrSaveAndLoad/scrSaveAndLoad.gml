global.SaveData =
{
	//Player
	SaveX : 0,
	SaveY : 0,
	SaveHP : 0,
	SaveLOVE : 0,
	SaveKillCount : 0,
	SaveSpareCount : 0,
	SaveEXP : 0,
	SaveGold : 0,
	SaveATK : 0,
	SaveDEF : 0,
	SaveWeapon : 0,
	SaveArmor : 0,
	SaveName : "",
	SaveFace : 0,
	SaveRoom : "",
	SaveRoomName : "",
	SaveZone : "",
	SaveItems : 0,
	
	//Config
	SaveMusVol : 0,
	SaveSFXVol : 0,
}

function SAVE()
{
	var _SaveArray = array_create(0);
	
	//Save player stuff
	global.SaveData.SaveX = global.Player.X;
	global.SaveData.SaveY = global.Player.Y;
	global.SaveData.SaveHP = global.Player.HP;
	global.SaveData.SaveLOVE = global.Player.LOVE;
	global.SaveData.SaveKillCount = global.Player.KillCount;
	global.SaveData.SaveSpareCount = global.Player.SpareCount;
	global.SaveData.SaveEXP = global.Player.EXP;
	global.SaveData.SaveGold = global.Player.Gold;
	global.SaveData.SaveATK = global.Player.ATK;
	global.SaveData.SaveDEF = global.Player.DEF;
	global.SaveData.SaveWeapon = global.Player.Weapon;
	global.SaveData.SaveArmor = global.Player.Armor;
	global.SaveData.SaveName = global.Player.Name
	global.SaveData.SaveFace = objPlayer.face;
	global.SaveData.SaveRoom = room_get_name(room);
	global.SaveData.SaveRoomName = global.RoomName;
	global.SaveData.SaveZone = global.Zone;
	global.SaveData.SaveItems = objItemManager.inv;
	
	//Save config
	global.SaveData.SaveMusVol = global.music_volume;
	global.SaveData.SaveSFXVol = global.sfx_volume;
	
	
	array_push(_SaveArray, global.SaveData);
	
	//ACTUAL SAVING!!!!!!!111!1
	var _filename = "SaveData.sav";
	var _json = json_stringify(_SaveArray, true);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function LOAD()
{
	
	//Load safe data
	var _filename = "SaveData.sav";
	if !file_exists(_filename) exit;
	
	//Load buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//get the data
	var _LoadArray = json_parse(_json);
	
	//set data to the one saved
		//Player
		global.SaveData = array_get(_LoadArray, 0);
		global.Player.X = global.SaveData.SaveX;
		global.Player.Y = global.SaveData.SaveY;
		global.Player.LOVE = global.SaveData.SaveLOVE;
		global.Player.MaxHP = 20 + ((global.Player.LOVE - 1) * 4);
		global.Player.HP = global.SaveData.SaveHP;
		global.Player.KillCount = global.SaveData.SaveKillCount;
		global.Player.SpareCount = global.SaveData.SaveSpareCount;
		global.Player.EXP = global.SaveData.SaveEXP;
		global.Player.Gold = global.SaveData.SaveGold;
		global.Player.ATK = global.SaveData.SaveATK;
		global.Player.DEF = global.SaveData.SaveDEF;
		global.Player.Weapon = global.SaveData.SaveWeapon;
		global.Player.Armor = global.SaveData.SaveArmor;
		global.Player.Name = global.SaveData.SaveName;
		objItemManager.inv = global.SaveData.SaveItems;
		
		//Config
		global.music_volume = global.SaveData.SaveMusVol;
		global.sfx_volume = global.SaveData.SaveSFXVol;
	
	//go to the correct room
	var _LoadRoom = asset_get_index(global.SaveData.SaveRoom);
	room_goto(_LoadRoom);
	objPlayer.x = global.Player.X;
	objPlayer.y = global.Player.Y;
	objPlayer.face = global.SaveData.SaveFace;
	objPlayer.can_move = true;
	objPlayer.visible = true;


}
