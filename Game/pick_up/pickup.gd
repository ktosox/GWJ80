extends Area2D

signal deleteBullets

func _ready() -> void:
	connect("deleteBullets", Callable(GameManager, "on_pickup_collected"))
	$AnimationPlayer.play("appearing")

func _on_body_entered(body: Node2D) -> void:
	deleteBullets.emit()
	queue_free()
