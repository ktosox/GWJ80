extends AnimationPlayer

const sprite = preload("res://visuals/stunt_circle.tscn")
@export var spritesRendered : int = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("game_over" , Callable(self, "deathAnimation"))
	#await get_tree().create_timer(10.0).timeout
	#play("death") # Replace with function body.

func deathAnimation():
	var children = []
	for i in range(spritesRendered):
		var child = sprite.instantiate()
		add_sibling.call_deferred(child)
		child.deathAnimation()
		children.append(child)
