if input_check_pressed("confirm") && file_exists("SaveData.sav")
{
	room_goto(rmStartMenu);
}
else if input_check_pressed("confirm") && !file_exists("SaveData.sav")
{
	room_goto(rmHowToPlay);
}