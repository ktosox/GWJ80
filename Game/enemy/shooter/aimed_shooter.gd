extends Node2D


@export var target : Node2D

@export var gun_A : PackedScene

@export var cooldown = 2.0

func _physics_process(delta: float) -> void:
	
	# aim gun at player needs to go here
	if target != null:
		look_at(target.global_position)


func _ready() -> void:
	if gun_A != null:
		
		var new_gun = gun_A.instantiate()
		new_gun.cooldown = cooldown
		$GunSpot.add_child(new_gun)
