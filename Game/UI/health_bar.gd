extends Control
const heartTexture = preload("res://UI/pngheart.png")
const lostHeartTexture = preload("res://UI/png lost heart.png")
@export var heartNodes : Array[Sprite2D]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		GameManager.connect("health_changed",Callable(self,"update_health")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_health(new_health : int):
	if new_health < heartNodes.size():
		heartNodes[new_health].texture = lostHeartTexture
