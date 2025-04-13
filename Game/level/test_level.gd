extends Node2D

@export var current_player : NodePath

var game_over_scene = preload("res://level/game_over.tscn")
var score : int = 0

var lose : bool = false

var wave : int = 1

func _ready() -> void:
	#Global.save_game() 
	Global.load_game()
	


func lose_game():
	
	if(Global.high_score < score):
		Global.high_score = score
		Global.save_game()
	
	var game_over = game_over_scene.instantiate()
	add_child(game_over)
	pass

func _on_player_player_got_hit() -> void:
	if $Player.HP < 1:
		lose = true
		lose_game()
	pass # Replace with function body.
