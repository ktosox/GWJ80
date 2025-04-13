extends Label

@onready var player: CharacterBody2D = $"../Player"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(player.HP) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_player_got_hit() -> void:
	text = str(player.HP) # Replace with function body.
