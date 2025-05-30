extends Control
const heartTexture = preload("res://UI/pngheart.png")
const lostHeartTexture = preload("res://UI/png lost heart.png")
@export var heartNodes : Array[Sprite2D]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		GameManager.connect("health_changed",Callable(self,"update_health")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_health(new_health : int):
	$TextureProgressBar.value = new_health
	if new_health < heartNodes.size():
		for i in range(heartNodes.size() - new_health):
			heartNodes[(heartNodes.size() - i) - 1].self_modulate = Color(0.5, 0.5, 0.5)
		
	if(new_health <=3):
		$TextureProgressBar.texture_under = preload("res://UI/3_hearts.png")
		$TextureProgressBar.texture_progress = preload("res://UI/3_hearts.png")
	elif(new_health > 3):
		$TextureProgressBar.texture_under = preload("res://UI/5_hearts.png")
		$TextureProgressBar.texture_progress = preload("res://UI/5_hearts.png")
