extends RigidBody2D

signal activated

var target : Node2D

@export var base_follow_speed = 400

@export var active = false

const DISTANCE_SPEED_MOD = 8900


func _physics_process(delta: float) -> void:
	
	# aim gun at player needs to go here
	if target != null:
		var follow_direction = target.global_position - global_position
		linear_velocity += follow_direction.normalized() * (base_follow_speed + DISTANCE_SPEED_MOD/(1+target.global_position.distance_squared_to(global_position)) ) * delta


func _on_body_entered(body: Node) -> void:
	queue_free()
	pass # Replace with function body.


func _on_player_detector_body_entered(body: Node2D) -> void:
	if !active:
		$Line2D.default_color = Color("blue")
		active = true
		target = body
		activated.emit()


func _on_player_detector_body_exited(body: Node2D) -> void: # not connected in current version
	$Line2D.default_color = Color("white")
	active = false
	target = null
	pass # Replace with function body.
