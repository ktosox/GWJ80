extends Node2D


var score : int = 0

var lose : bool = false

var wave : int = 1



func _ready() -> void:
	#Global.save_game() 
	GameManager.set_health(3)
	GameManager.set_score(0)
	Global.load_game()

	
