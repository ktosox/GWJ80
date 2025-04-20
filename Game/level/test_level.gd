extends Node2D


var score : int = 0

var lose : bool = false

var wave : int = 1

@onready var ui: CanvasLayer = $UI
var enemy_spawners : Array

var pickup_enemy_count : int = 0
var pickup_enemy_max = 1



func _ready() -> void:
	#Global.save_game() 
	print($enemy_spawners.get_child_count())
	GameManager.set_health(3)
	GameManager.set_score(0)
	Global.load_game()
	
	ui.get_node("Layout/Wave").text = "Wave: "+str(wave)
	
	enemy_spawners = $enemy_spawners.get_children()
	
	GameManager.connect("screen_cleaner", Callable(self, "clear_enemies")) # I had no idea it was supposed to work this way, seems kinda OP
	GameManager.manage_tutorial()


func _on_wave_timer_timeout() -> void:
	wave += 1
	ui.get_node("Layout/Wave").text = "Wave: "+str(wave)


func _on_spawn_timer_timeout() -> void:
	pickup_enemy_count += 1
	if(pickup_enemy_max == pickup_enemy_count):
		enemy_spawners[randi_range(0, len(enemy_spawners)-1)].spawn_enemy(wave, true)
		pickup_enemy_count = 0
	elif(pickup_enemy_max != pickup_enemy_count):
		enemy_spawners[randi_range(0, len(enemy_spawners)-1)].spawn_enemy(wave, false)
		pickup_enemy_count = 0
		
func clear_enemies():
	for i in $enemy_group_node.get_children():
		i.queue_free()
