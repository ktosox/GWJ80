extends Area2D

signal hit_detected()
var lastBulletToHitPosition

func _on_body_entered(body: Node2D) -> void:
	#if !body.active:
	#	return
	lastBulletToHitPosition = body.global_position
	emit_signal("hit_detected")
	body.queue_free()
	pass # Replace with function body.




		
