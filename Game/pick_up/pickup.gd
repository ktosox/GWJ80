extends Area2D

signal pickupCollected

func _ready() -> void:
	connect("pickupCollected", Callable(GameManager, "on_pickup_collected"))
	$AnimationPlayer.play("appearing")

func _on_body_entered(body: Node2D) -> void:
	print("pickup working")
	pickupCollected.emit()
	queue_free()
