extends Area2D

enum Pickup{health, shield, speed, screen_cleaner, gravity_fx}
var pickup_type : Pickup

var tag = "pick_up"

const PLUS_HEALTH_PICKUP = preload("res://pick_up/plus_health_pickup.png")
const SHIELD_PICKUP = preload("res://pick_up/shield_pickup.png")
const SPEED = preload("res://pick_up/speed.png")
const CLEANER_PICKUP = preload("res://pick_up/cleaner_pickup.png")
const GRAVITY_FX = preload("res://pick_up/gravity_fx.png")

@onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random_pickup = randi_range(1, 5)
	if(random_pickup == 1):
		pickup_type = Pickup.health
		$CollisionShape2D/Sprite2D.texture = PLUS_HEALTH_PICKUP
		$CollisionShape2D/Sprite2D.position = Vector2(-8, 3)
	elif(random_pickup == 2):
		pickup_type = Pickup.shield
		$CollisionShape2D/Sprite2D.texture = SHIELD_PICKUP
	elif(random_pickup == 3):
		pickup_type = Pickup.speed
		$CollisionShape2D/Sprite2D.texture = SPEED
	elif(random_pickup == 4):
		pickup_type = Pickup.screen_cleaner
		$CollisionShape2D/Sprite2D.texture = CLEANER_PICKUP
	elif(random_pickup == 5):
		pickup_type = Pickup.gravity_fx
		$CollisionShape2D/Sprite2D.texture = GRAVITY_FX

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if(body == player):
		if(pickup_type == Pickup.health):
			GameManager.enable_pick_up("health")
		elif(pickup_type == Pickup.shield):
			GameManager.enable_pick_up("shield")
		elif(pickup_type == Pickup.speed):
			GameManager.enable_pick_up("speed")
		elif(pickup_type == Pickup.screen_cleaner):
			GameManager.enable_pick_up("screen_cleaner")
		elif(pickup_type == Pickup.gravity_fx):
			GameManager.enable_pick_up("gravity_fx")
		queue_free()
		

func _on_area_entered(area: Area2D) -> void:
	print(area) # Replace with function body.
