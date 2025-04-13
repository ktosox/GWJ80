extends CharacterBody2D

signal player_got_hit

const SPEED = 300.0

var HP = 3


func _physics_process(delta: float) -> void:

	var direction := Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))

	velocity = direction.normalized() * SPEED

	move_and_slide()


func _on_hit_box_hit_detected() -> void:
	HP -= 1
	emit_signal("player_got_hit")
	pass # Replace with function body.
