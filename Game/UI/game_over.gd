extends ColorRect


func _ready() -> void:
	get_tree().paused = true


func _on_reset_pressed() -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("up"):
		get_tree().paused = false
		get_tree().reload_current_scene()
