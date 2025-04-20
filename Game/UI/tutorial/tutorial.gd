extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	#Engine.time_scale = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("tutorial_exit")):
		get_tree().paused = false
		GameManager.isInTutorial = false
		queue_free()
