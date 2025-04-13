extends Node2D

signal shoot

@export var bullet_scene : PackedScene

const bullet_speed = 60


func shoot_gun(barrel : Node2D):
	var new_bullet = bullet_scene.instantiate() as RigidBody2D
	new_bullet.global_position = barrel.global_position
	new_bullet.apply_central_impulse(bullet_speed * Vector2.RIGHT.rotated(global_rotation + barrel.rotation))
	get_tree().current_scene.add_child(new_bullet)


func _on_cooldown_timeout() -> void:
	shoot_gun($Line2D)
	shoot_gun($Line2D2)
	shoot_gun($Line2D3)
	shoot.emit()
