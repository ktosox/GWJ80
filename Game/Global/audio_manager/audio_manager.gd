extends Node

@onready var sound_player : AudioStreamPlayer = $MusicPlayer
@onready var music_player : AudioStreamPlayer = $MusicPlayer


func play(type : String, audio : AudioStream) -> void:
	var stream_player : AudioStreamPlayer
	
	match type:
		"sound":
			stream_player = sound_player
		"music":
			stream_player = music_player
	
	stream_player.stream = audio
	stream_player.play()
