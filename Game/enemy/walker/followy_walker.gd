extends RigidBody2D


@export var target : Node2D

@export var speed = 90

var walk_direction_mod = 1 # 0 for stop / 1 for follow / -1 for walk away

func _ready() -> void:
	var player_check = get_tree().get_nodes_in_group("Player") # automaticly check if there is a node in the Player group somewhere on scene
	if player_check.size() > 0 and target == null: # if there is a player and target is null -> set target
		target = player_check[0]
	if target == null:
		set_physics_process(false)
	pass


func _physics_process(delta: float) -> void:
	
	var walk_direction = target.global_position - global_position
	linear_velocity = walk_direction_mod * walk_direction.normalized() * speed

	


func _on_too_far_range_body_entered(body: Node2D) -> void:
	walk_direction_mod = 0
	pass # Replace with function body.

func _on_too_close_range_body_entered(body: Node2D) -> void:
	walk_direction_mod = -1
	pass # Replace with function body.


func _on_too_close_range_body_exited(body: Node2D) -> void:
	walk_direction_mod = 0
	pass # Replace with function body.


func _on_too_far_range_body_exited(body: Node2D) -> void:
	walk_direction_mod = 1
	pass # Replace with function body.
