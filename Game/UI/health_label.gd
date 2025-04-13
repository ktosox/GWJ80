extends Label



# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	GameManager.connect("health_changed",Callable(self,"update_health"))
	


func update_health(new_health : int):
	text = str(new_health)
	pass
