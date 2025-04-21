extends Area2D

enum Pickup{health = 0, shield, speed, screen_cleaner, gravity_fx}
@export var pickup_type : Pickup
@export var randomize_pickup = true
var tag = "pick_up"
signal picked_up


const PLUS_HEALTH_PICKUP = {
	"image" : preload("res://pick_up/plus_health_pickup.png"),
	"sound" : preload("res://pick_up/bonus_health.wav"),
}
const SHIELD_PICKUP = {
	"image" : preload("res://pick_up/shield_pickup.png"),
	"sound" : preload("res://pick_up/shield.wav"),
}
const SPEED = {
	"image" : preload("res://pick_up/speed.png"),
	"sound" : preload("res://pick_up/bonus_speed.wav"),
}
const CLEANER_PICKUP = {
	"image" : preload("res://pick_up/cleaner_pickup.png"),
	"sound" : preload("res://pick_up/clear_screen.wav"),
}
const GRAVITY_FX = {
	"image" : preload("res://pick_up/gravity_fx.png"),
	"sound" : preload("res://pick_up/repel_bullets.wav"),
}

@onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randomize_pickup:
		pickup_type = randi_range(0,Pickup.size())
	if(pickup_type == Pickup.health):
		$CollisionShape2D/Sprite2D.texture = PLUS_HEALTH_PICKUP["image"]
		$AudioComponent.audio = PLUS_HEALTH_PICKUP["sound"]
		#$CollisionShape2D/Sprite2D.position = Vector2(-8, 3) no idea why this line is here so I removed it for testing
	elif(pickup_type == Pickup.shield):

		$CollisionShape2D/Sprite2D.texture = SHIELD_PICKUP["image"]
		$AudioComponent.audio = SHIELD_PICKUP["sound"]
	elif(pickup_type == Pickup.speed):

		$CollisionShape2D/Sprite2D.texture = SPEED["image"]
		$AudioComponent.audio = SPEED["sound"]
	elif(pickup_type == Pickup.screen_cleaner):

		$CollisionShape2D/Sprite2D.texture = CLEANER_PICKUP["image"]
		$AudioComponent.audio = CLEANER_PICKUP["sound"]
	elif(pickup_type == Pickup.gravity_fx):

		$CollisionShape2D/Sprite2D.texture = GRAVITY_FX["image"]
		$AudioComponent.audio = GRAVITY_FX["sound"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	picked_up.emit()
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
	print_debug(area) # Replace with function body.
