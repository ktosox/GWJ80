extends Label


func _ready() -> void:
	GameManager.connect("score_changed",Callable(self,"update_score"))
	


func update_score(new_score : int):
	text = str(new_score)
