extends Node2D
const PICKUP = preload("res://pick_up/pickup.tscn")
@onready var timer: Timer = $Timer




func _on_pickup_spawn_rate_timeout() -> void:
	var child = PICKUP.instantiate()
	add_child(child)
	child.position = Vector2(randi_range(0, 1280), randi_range(0,720))
