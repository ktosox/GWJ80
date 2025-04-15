extends Sprite2D
@onready var update_rate: Timer = $updateRate
@export var minimumMomentum = 30
@export var maximumMomentum = 70
@export var subtractAmount = 0.03
@export var SubtractAmountGrowth = 0.01
var deathAnimationSetupComplete = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var direction
var momentum
func deathAnimation():
	direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	momentum = randf_range(minimumMomentum,maximumMomentum)
	deathAnimationSetupComplete = true
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if deathAnimationSetupComplete and momentum > 0:
		position += momentum * direction * delta
		momentum -= subtractAmount
		subtractAmount += 0.01
