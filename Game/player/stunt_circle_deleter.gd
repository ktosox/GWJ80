extends Area2D
const STUNT_CIRCLE = preload("res://visuals/stunt_circle.tscn")

func _on_area_entered(area: Area2D) -> void:
	area.owner.queue_free()
