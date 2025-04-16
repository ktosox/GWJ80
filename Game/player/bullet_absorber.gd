extends Area2D
@onready var player: CharacterBody2D = $".."




func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	player.ammo += 1 # Replace with function body.
