extends Node2D


var score : int = 0

var lose : bool = false

var wave : int = 1

@onready var ui: CanvasLayer = $UI
var enemy_spawners : Array


func _ready() -> void:
	#Global.save_game() 
	GameManager.set_health(3)
	GameManager.set_score(0)
	Global.load_game()
	
	ui.get_node("Layout/Wave").text = "Wave: "+str(wave)
	enemy_spawners = $enemy_spawners.get_children()
	
	


func _on_wave_timer_timeout() -> void:
	wave += 1
	ui.get_node("Layout/Wave").text = "Wave: "+str(wave)


func _on_spawn_timer_timeout() -> void:
	enemy_spawners[randi_range(0, len(enemy_spawners)-1)].spawn_enemy(wave)
