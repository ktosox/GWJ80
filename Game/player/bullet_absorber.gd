extends Area2D

@onready var gun: Node2D = $"../gun"

const stuntCircleScene = preload("res://visuals/stunt_circle.tscn")


var stuntCircle
func _on_bullet_entered(body: Node2D) -> void:
	var bodyPosition = to_local(body.global_position)
	body.queue_free()
	stuntCircle = spawnStuntCircle()
	setupStuntCircleAnimation(bodyPosition)
	gun.ammo += 1  

func spawnStuntCircle():
		var stuntCircleInstance = stuntCircleScene.instantiate()
		call_deferred("add_child", stuntCircleInstance)
		return stuntCircleInstance

func setupStuntCircleAnimation(targetPosition):
	stuntCircle.position = targetPosition
	stuntCircle.vacuumAnimation($vacuumGraphic)
