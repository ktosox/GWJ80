extends Node2D


@export var target : Node2D

@export var gun : PackedScene

@export var attack_speed = 2.0


func _ready() -> void:
	var player_check = get_tree().get_nodes_in_group("Player") # automaticly check if there is a node in the Player group somewhere on scene
	if player_check.size() > 0 and target == null: # if there is a player and target is null -> set target
		target = player_check[0]
	if gun != null:
		
		var new_gun = gun.instantiate()
		new_gun.cooldown = attack_speed
		$GunSpot.add_child(new_gun)


func _physics_process(delta: float) -> void:
	
	if target != null:
		look_at(target.global_position)
