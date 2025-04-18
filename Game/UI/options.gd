extends CanvasLayer

@export var audioDeafening = 20


func _ready() -> void:
	Engine.time_scale = 0.0


func _on_tree_exiting() -> void:
	Engine.time_scale = 1.0 # Replace with function body.
