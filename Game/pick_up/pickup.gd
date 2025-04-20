extends Area2D

enum Pickup{health = 0, shield, speed, screen_cleaner, gravity_fx}
@export var pickup_type : Pickup
@export var randomize_pickup = true
var tag = "pick_up"



const PLUS_HEALTH_PICKUP = preload("res://pick_up/plus_health_pickup.png")
const SHIELD_PICKUP = preload("res://pick_up/shield_pickup.png")
const SPEED = preload("res://pick_up/speed.png")
const CLEANER_PICKUP = preload("res://pick_up/cleaner_pickup.png")
const GRAVITY_FX = preload("res://pick_up/gravity_fx.png")

@onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randomize_pickup:
		pickup_type = randi_range(0,Pickup.size())
	if(pickup_type == Pickup.health):
		$CollisionShape2D/Sprite2D.texture = PLUS_HEALTH_PICKUP
		#$CollisionShape2D/Sprite2D.position = Vector2(-8, 3) no idea why this line is here so I removed it for testing
	elif(pickup_type == Pickup.shield):

		$CollisionShape2D/Sprite2D.texture = SHIELD_PICKUP
	elif(pickup_type == Pickup.speed):

		$CollisionShape2D/Sprite2D.texture = SPEED
	elif(pickup_type == Pickup.screen_cleaner):

		$CollisionShape2D/Sprite2D.texture = CLEANER_PICKUP
	elif(pickup_type == Pickup.gravity_fx):

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
			var new_flash = load("res://special/screen_cleaner.tscn").instantiate() # wasnt sure where to add this code so I'm putting it here
			get_tree().current_scene.add_child(new_flash)
		elif(pickup_type == Pickup.gravity_fx):
			GameManager.enable_pick_up("gravity_fx")
		queue_free()
		

func _on_area_entered(area: Area2D) -> void:
	print(area) # Replace with function body.
