extends Sprite2D

const PLUS_HEALTH_PICKUP = preload("res://pick_up/plus_health_pickup.png")
const SHIELD_PICKUP = preload("res://pick_up/shield_pickup.png")
const SPEED = preload("res://pick_up/speed.png")
const GRAVITY_FX = preload("res://pick_up/gravity_fx.png")
const CLEANER_PICKUP = preload("res://pick_up/cleaner_pickup.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GameManager.pick_up_enabled):
		if(GameManager.pick_up == "speed"):
			texture = SPEED
		elif(GameManager.pick_up == "shield"):
			texture = SHIELD_PICKUP
		elif(GameManager.pick_up == "gravity_fx"):
			texture = GRAVITY_FX
	elif(!GameManager.pick_up_enabled):
		texture = null
