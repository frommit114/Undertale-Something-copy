//Music variables
song_instance = noone;
song_asset = noone;
target_song_asset = noone;
	// both fade in and fade out are in frames
	song_fade_out_time = 0; //current song fade out
	song_fade_in_time = 0; //new song fade in
song_fade_in_instance_vol = 1;
current_song = noone;
last_song = noone;

//volume
global.sfx_volume = 1;
global.music_volume = 1;
clamp(global.sfx_volume, 0, 2)
clamp(global.music_volume, 0, 2)

//fading out and stopping songs
fade_out_instances = array_create(0); //audio instances to fade out
fade_out_instance_vol = array_create(0); 
fade_out_instance_time = array_create(0); 
