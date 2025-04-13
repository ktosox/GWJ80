extends Label
@onready var player: CharacterBody2D = $"../Player"
var score = 00.0
#filler for when i have access to score


func _ready() -> void:
	text = str(int(score)) # Replace with function body.



func _process(delta: float) -> void:
	score += 1.0 / 60
	text = str(int(score))
