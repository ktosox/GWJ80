extends Sprite2D

@export var minimumDeathAnimationMomentum = 30
@export var maximumDeathAnimationMomentum = 70
@export var deathSubtractAmount = 0.03
@export var deathSubtractAmountGrowth = 0.01
@export var deathAnimationSpriteColor = Color("83eb6c")

@export var vacuumAnimationSpeed = 100

var deathAnimationSetupComplete = false
var animationDoing 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var deathAnimationDirection
var deathAnimationMomentum
func deathAnimation():
	deathAnimationSetup()
	#rest happens in physics process

func deathAnimationSetup():
	self_modulate = deathAnimationSpriteColor
	deathAnimationDirection = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	deathAnimationMomentum = randf_range(minimumDeathAnimationMomentum,maximumDeathAnimationMomentum)
	animationDoing = "death"

var vacuumTarget : Node2D
func vacuumAnimation(target: Node2D):
	vacuumTarget = target
	animationDoing = "vacuum"




func _physics_process(delta: float) -> void:
	if animationDoing == "death" and deathAnimationMomentum > 0:
		deathMovementPerFrame(delta)
	elif animationDoing == "vacuum":
		vacuumMovementPerFrame(delta)

func deathMovementPerFrame(delta):
	position += deathAnimationMomentum * deathAnimationDirection * delta
	deathAnimationMomentum -= deathSubtractAmount
	deathSubtractAmount += deathSubtractAmountGrowth

func vacuumMovementPerFrame(delta):
	moveTowardsTarget(vacuumTarget, vacuumAnimationSpeed * delta)

func moveTowardsTarget(Target:Node2D, momentum):
	look_at(Target.global_position)
	position += Vector2.RIGHT.rotated(rotation) * momentum
