extends Node2D

@export var bullet_speed = 800

signal grab

var grabbed_bullet : RigidBody2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	if grabbed_bullet != null:
		$GrabPoint.rotation = 0
		grabbed_bullet.call_deferred("reparent",get_tree().current_scene)
		grabbed_bullet.linear_velocity = bullet_speed * Vector2.RIGHT.rotated(global_rotation)
		grabbed_bullet.set_deferred("freeze",false)
		grabbed_bullet = null
		$GrabPoint/GrabAniamtor.play("fire")
		$GrabPoint/SuckInBullets.gravity_space_override = Area2D.SPACE_OVERRIDE_COMBINE
	else:

		# a "no ammo" sound could go here
		pass


func _on_lock_in_bullet_body_entered(body: RigidBody2D) -> void:
	if grabbed_bullet != null:
		return
	emit_signal("grab")
	body.set_collision_layer_value(6,false)
	body.set_collision_layer_value(5,true)
	body.modulate = Color("Cyan")
	$GrabPoint.global_rotation = body.linear_velocity.angle()
	body.linear_velocity = Vector2.ZERO
	body.set_deferred("freeze",true)
	body.set_deferred("global_position",$GrabPoint/VisualPart.global_position)
	body.call_deferred("reparent",$GrabPoint/VisualPart)
	
	grabbed_bullet = body
	
	$GrabPoint/GrabAniamtor.call_deferred("play","grab")
	$GrabPoint/SuckInBullets.gravity_space_override = Area2D.SPACE_OVERRIDE_DISABLED
	pass # Replace with function body.
