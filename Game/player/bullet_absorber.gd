extends Area2D

@onready var gun: Node2D = $"../gun"
const stuntCircle = preload("res://visuals/stunt_circle.tscn")



func _on_body_entered(body: Node2D) -> void:
	var bodyPosition = to_local(body.global_position)
	body.queue_free()
	var stuntCircleInstance = stuntCircle.instantiate()
	add_child(stuntCircleInstance)
	stuntCircleInstance.position = bodyPosition
	stuntCircleInstance.look_at(self.global_position)
	stuntCircleInstance.vacuumAnimation($Sprite2D)
	gun.ammo += 1 # Replace with function body.
