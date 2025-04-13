extends ColorRect


func _ready() -> void:
	get_tree().paused = true


func _on_reset_pressed() -> void:
	
	get_tree().paused = false
	
	get_tree().reload_current_scene()
	pass # Replace with function body.
