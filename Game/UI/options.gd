extends CanvasLayer



func _ready() -> void:
	Engine.time_scale = 0.0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("options access"):
		
		Engine.time_scale = 1.0
		queue_free() # Replace with function body.
