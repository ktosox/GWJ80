extends Label
@onready var test_level: Node2D = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(Global.high_score) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if test_level.score > Global.high_score:
		text = test_level.score
