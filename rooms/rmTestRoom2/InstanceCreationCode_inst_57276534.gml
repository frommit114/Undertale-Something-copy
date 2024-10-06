t_scene_info =
[
	[CutsceneChangeVariable, objPlayer, "can_move", false],
	[SetSongIngame, noone, 60, 0],
	[CutsceneMoveCamera, 0, 500, true, 0.05],
	[CutsceneWait, 2],
	[create_textbox, "test cutscene 2"],
	[CutsceneMoveCamera, 0, -500, true, 0.08],
	[SetSongIngame, musTestSong2, 0, 30],
	
]