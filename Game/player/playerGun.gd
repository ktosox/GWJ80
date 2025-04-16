extends Node2D
@export var Bullet = preload("res://player/players bullet/players_bullet.tscn")
@export var bullet_speed = 1000
@onready var player: CharacterBody2D = $".."
var ammo = 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()


func shoot():
	print("shoot executed")
	if ammo > 0:
		print("ammo")
		var bulletInstance = Bullet.instantiate()
		owner.add_sibling(bulletInstance)
		bulletInstance.global_position = global_position
		bulletInstance.global_rotation = global_rotation
		bulletInstance.linear_velocity = bullet_speed * Vector2.RIGHT.rotated(global_rotation)
		ammo -= 1


func reset_ammo():
	print("ammo reset")
	#this is for the animationPLayer
	ammo = 0
