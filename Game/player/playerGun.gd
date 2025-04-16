extends Node2D
@export var Bullet = preload("res://bullet/bullet.tscn")
@export var bullet_speed = 1000
@onready var player: CharacterBody2D = $".."

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()


func shoot():
	if player.ammo > 0:
		var bulletInstance = Bullet.instantiate()
		owner.add_sibling(bulletInstance)
		bulletInstance.global_position = global_position
		bulletInstance.global_rotation = global_rotation
		bulletInstance.linear_velocity = bullet_speed * Vector2.RIGHT.rotated(global_rotation)
		player.ammo -= 1
