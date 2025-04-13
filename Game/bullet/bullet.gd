extends RigidBody2D

var target : Node2D

@export var active = false

func _physics_process(delta: float) -> void:
	
	# aim gun at player needs to go here
	if target != null:
		var follow_direction = target.global_position - global_position
		linear_velocity += follow_direction.normalized() * (400 + 8900/(1+target.global_position.distance_squared_to(global_position)) ) * delta


func _on_body_entered(body: Node) -> void:
	queue_free()
	pass # Replace with function body.


func _on_player_detector_body_entered(body: Node2D) -> void:
	$Line2D.default_color = Color("blue")
	active = true
	target = body
	pass # Replace with function body.


func _on_player_detector_body_exited(body: Node2D) -> void:
	$Line2D.default_color = Color("white")
	active = false
	target = null
	pass # Replace with function body.
