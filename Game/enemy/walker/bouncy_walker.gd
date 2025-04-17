extends RigidBody2D

@export var speed = 90


func _ready() -> void:
	linear_velocity = Vector2.UP.rotated(2 * PI * randf()) * speed # 2 * PI * randf() means: random angle from 0 to 360 degrees
	pass
