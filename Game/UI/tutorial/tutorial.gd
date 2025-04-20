extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("tutorial_exit")):
		Engine.time_scale = 1.0
		GameManager.isInTutorial = false
		queue_free()
