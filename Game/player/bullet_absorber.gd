extends Area2D

@onready var gun: Node2D = $"../gun"




func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	gun.ammo += 1 # Replace with function body.
