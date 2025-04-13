extends Label



@onready var player: CharacterBody2D = %Player

@onready var test_level: Node2D = $".."



func _ready() -> void:
	text = str(test_level.score) # Replace with function body.



func _process(delta: float) -> void:
	text = str(test_level.score)
