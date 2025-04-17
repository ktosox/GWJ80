extends Node

@onready var sound_player : AudioStreamPlayer = $SoundPlayer
@onready var music_player : AudioStreamPlayer = $MusicPlayer


func play(type : String, audio : AudioStream) -> void:
	var stream_player : AudioStreamPlayer = get_stream(type)

	stream_player.stream = audio
	stream_player.play()


func stop(type : String) -> void:
	var stream_player : AudioStreamPlayer = get_stream(type)

	stream_player.stop()


func get_stream(type : String) -> AudioStreamPlayer:
	match type:
		"sound":
			return sound_player
		
		"music":
			return music_player

	return null
