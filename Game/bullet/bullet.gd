extends RigidBody2D

signal activated


@export var active = false




func _on_body_entered(body: Node) -> void:
	queue_free()
	pass # Replace with function body.


func _on_player_detector_body_entered(body: Node2D) -> void:
	if !active:
		$Line2D.default_color = Color("blue")
		active = true
		activated.emit()


#func _on_player_detector_body_exited(body: Node2D) -> void: # not connected in current version
	#$Line2D.default_color = Color("white")
	#active = false
#
	#pass # Replace with function body.
