extends Node2D
@export var BulletScene = preload("res://player/players bullet/players_bullet.tscn")
@export var bullet_speed = 1000
@onready var player: CharacterBody2D = $".."
var ammo = 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()


func shoot():
	if ammo > 0:
		var bullet = spawnBullet()
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		bullet.linear_velocity = bullet_speed * Vector2.RIGHT.rotated(global_rotation)
		ammo -= 1


func spawnBullet():
	var bulletInstance = BulletScene.instantiate()
	owner.add_sibling(bulletInstance)
	return bulletInstance

func reset_ammo():
	#this is for the animationPLayer
	ammo = 0
