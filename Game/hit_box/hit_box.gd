extends Area2D

signal hit_detected

func _on_body_entered(body: Node2D) -> void:
	if !body.active:
		return
	body.queue_free()
	emit_signal("hit_detected")
	pass # Replace with function body.
