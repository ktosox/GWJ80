extends CanvasLayer



func _ready() -> void:
	get_tree().paused = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("options access"):
		
		get_tree().paused = false
		queue_free() # Replace with function body.


func _on_tutorial_btn_pressed() -> void:
	GameManager.manage_tutorial()
	queue_free()
