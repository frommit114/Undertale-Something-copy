function SetSongIngame(_song, _fade_out_current_song = 0, _fade_in = 0)
{
	with (objSoundManager)
	{
		target_song_asset = _song;
		song_fade_out_time = _fade_out_current_song;
		song_fade_in_time = _fade_in;
	}
	if instance_exists(objCutscene)
	{
	     CutsceneEndAction();
	}
}