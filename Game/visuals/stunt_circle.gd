extends Sprite2D
@onready var update_rate: Timer = $updateRate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var direction
var momentum
var subtractAmount
func deathAnimation():
	direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	momentum = randf_range(30,50)
	subtractAmount = 0.03
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if subtractAmount and momentum > 0:
		position += momentum * direction * delta
		momentum -= subtractAmount
		subtractAmount += 0.01
