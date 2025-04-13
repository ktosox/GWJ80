extends Node2D

@export var current_player : NodePath

var game_over_scene = preload("res://level/game_over.tscn")

func lose_game():
	var game_over = game_over_scene.instantiate()
	add_child(game_over)
	pass

func _on_player_player_got_hit() -> void:
	if $Player.HP < 1:
		lose_game()
	pass # Replace with function body.
