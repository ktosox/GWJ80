extends Sprite2D
@onready var update_rate: Timer = $updateRate

@export var minimumDeathAnimationMomentum = 30
@export var maximumDeathAnimationMomentum = 70
@export var subtractAmount = 0.03
@export var SubtractAmountGrowth = 0.01

var deathAnimationSetupComplete = false
var animationDoing 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var direction
var momentum
func deathAnimation():
	animationDoing = "death"
	self_modulate = Color("83eb6c")
	direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	momentum = randf_range(minimumDeathAnimationMomentum,maximumDeathAnimationMomentum)
	deathAnimationSetupComplete = true
	

var vacuumTarget : Node2D
func vacuumAnimation(target: Node2D):
	animationDoing = "vacuum"
	vacuumTarget = target



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if animationDoing == "death" and momentum > 0:
		position += momentum * direction * get_process_delta_time()
		momentum -= subtractAmount
		subtractAmount += 0.01
	elif animationDoing == "vacuum":
		position += Vector2(100,0).rotated(rotation) * delta
		
