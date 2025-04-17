extends Node2D


@export var target : Node2D

@export var gun_A : PackedScene

@export var cooldown = 2.0

func _physics_process(delta: float) -> void:
	
	# aim gun at player needs to go here
	if target != null:
		look_at(target.global_position)


func _ready() -> void:
	var player_check = get_tree().get_nodes_in_group("Player") # automaticly check if there is a node in the Player group somewhere on scene
	if player_check.size() > 0 and target == null: # if there is a player and target is null -> set target
		target = player_check[0]
	if gun_A != null:
		
		var new_gun = gun_A.instantiate()
		new_gun.cooldown = cooldown
		$GunSpot.add_child(new_gun)
