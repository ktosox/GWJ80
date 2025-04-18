extends Node2D

@export var cooldown = 3.0

@export var bullet_scene : PackedScene

const bullet_speed = 60

func _ready() -> void:
	$Cooldown.wait_time = cooldown

func shoot_gun(barrel : Node2D):
	var new_bullet = bullet_scene.instantiate() as RigidBody2D
	new_bullet.global_position = barrel.global_position
	new_bullet.apply_central_impulse(bullet_speed * Vector2.RIGHT.rotated(global_rotation + barrel.rotation))
	get_tree().current_scene.add_child(new_bullet)
	pass

func _on_cooldown_timeout() -> void:
	shoot_gun($Gun)
	shoot_gun($Gun2)
	shoot_gun($Gun3)
	pass # Replace with function body.
