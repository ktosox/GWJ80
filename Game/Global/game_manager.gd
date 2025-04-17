extends Node

signal score_changed(new_score)

signal health_changed(new_health)

signal game_over()

signal speed_changed(normal_speed_)

signal enable_shield()

signal screen_cleaner()

signal gravity_fx()

@export var game_over_scene : PackedScene

@export var current_player : CharacterBody2D

@export var current_score : int

@export var current_health : int

var pick_up : String 
var pick_up_enabled : bool = false


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
	emit_signal("game_over")
	await get_tree().create_timer(3).timeout
	get_tree().current_scene.lose = true
	
	
	var game_over = game_over_scene.instantiate()
	get_tree().current_scene.add_child(game_over)
	pass


	

func enable_pick_up(pick_up_ : String):
	pick_up_enabled = true
	pick_up = pick_up_
	if(pick_up_ == "health"):
		change_health(2)
	elif(pick_up == "speed"):
		emit_signal("speed_changed", false)
		$pick_up_timer.start()
	elif (pick_up_ == "shield"):
		emit_signal("enable_shield")
	elif (pick_up_ == "screen_cleaner"):
		emit_signal("screen_cleaner")
	elif (pick_up_ == "gravity_fx"):
		emit_signal("gravity_fx")
	


func _on_pick_up_timer_timeout() -> void:
	pick_up_enabled = false
	emit_signal("speed_changed", true)
