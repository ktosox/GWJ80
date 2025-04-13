extends Node

class_name AudioComponent

@export var signal_name : String
@export_enum("sound", "music") var audio_type : String = "sound"
@export var audio : AudioStream


func _ready() -> void:
	owner = get_parent()
	owner.connect(signal_name, play)


func play() -> void:
	AudioManager.play(audio_type, audio)
