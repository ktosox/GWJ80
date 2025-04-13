extends Node

signal score_changed(new_score)

signal health_changed(new_health)

@export var game_over_scene : PackedScene

@export var current_player : CharacterBody2D

@export var current_score : int

@export var current_health : int


func change_score(amount = 0):
	current_score += amount
	emit_signal("score_changed",current_score)
	pass


func set_score(new_score : int):
	current_score = new_score
	emit_signal("score_changed",current_score)
	pass

func change_health(amount = 0): # - for health lost, + for health gained
	current_health += amount
	emit_signal("health_changed",current_health)
	if current_health < 1:
		lose_game()
	pass

func set_health(new_health : int):
	current_health = new_health
	emit_signal("health_changed",current_health)


func lose_game():
	
	if(Global.high_score < current_score):
		Global.high_score = current_score
		Global.save_game()
	
	var game_over = game_over_scene.instantiate()
	get_tree().current_scene.add_child(game_over)
	pass
