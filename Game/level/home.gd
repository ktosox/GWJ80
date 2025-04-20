extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_play_btn_button_down() -> void:
	get_tree().change_scene_to_file("res://level/test_level.tscn")
