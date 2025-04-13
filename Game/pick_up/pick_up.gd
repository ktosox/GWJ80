extends Area2D

# need to add a "type" property from a list of implemented features



func _ready() -> void:
	# change modulate color depending on "type"
	pass

func _on_body_entered(body: Node2D) -> void:
	# "type" specific functionality should go here
	$Star.visible = false
	$CPUParticles2D.emitting = true
	$CollisionShape2D.set_deferred("disabled",true)
	await get_tree().create_timer(4).timeout # clean up after 4s
	queue_free()
	pass # Replace with function body.
