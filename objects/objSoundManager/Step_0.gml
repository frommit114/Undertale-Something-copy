var _finalVol = global.music_volume;

//Play target song
if song_asset != target_song_asset
{
	//tell the old song to fuc- i mean fade out
	if audio_is_playing( song_instance )
	{
		array_push( fade_out_instances, song_instance );
		array_push( fade_out_instance_vol, song_fade_in_instance_vol );
		array_push(fade_out_instance_time, song_fade_out_time );
		
		//reset song instance and asset vars
		song_instance = noone;
		song_asset = noone;
	
	}
	
	//play the song if the old one has faded out
	if array_length(fade_out_instances) == 0
	{
		if audio_exists( target_song_asset )
		{
			song_instance = audio_play_sound( target_song_asset, 4, true )
			audio_sound_gain( song_instance, 0, 0)
			song_fade_in_instance_vol = 0;
		}
		song_asset = target_song_asset;
	}
}

//Volume control
	if audio_is_playing( song_instance )
	{
		if song_fade_in_time > 0
		{
			if song_fade_in_instance_vol < 1 { song_fade_in_instance_vol += 1/song_fade_in_time; } else song_fade_in_instance_vol = 1;
		}
		else 
		{
			song_fade_in_instance_vol = 1;
		}
	
		audio_sound_gain( song_instance, song_fade_in_instance_vol*_finalVol, 0);
	}
	
	//fading songs out
	for( var i = 0; i < array_length(fade_out_instances); i++ )
	{
		//fade the volume
		if fade_out_instance_time[i] > 0
		{
			if fade_out_instance_vol[i] > 0 { fade_out_instance_vol[i] -= 1/fade_out_instance_time[i]  }
		}
		else 
		{
			fade_out_instance_vol[i] = 0;
		}
		
		audio_sound_gain( fade_out_instances[i], fade_out_instance_vol[i]*_finalVol, 0 )
		
		//stop song and remove it from the array
		if fade_out_instance_vol[i] <= 0
		{
			if audio_is_playing( fade_out_instances[i] ) { audio_stop_sound( fade_out_instances[i] ); }
			array_delete( fade_out_instances, i, 1 );
			array_delete( fade_out_instance_vol, i, 1 );
			array_delete( fade_out_instance_time, i, 1 );
			i --;
		}
	}
	
	
	
	
	
	
	
	
	
	