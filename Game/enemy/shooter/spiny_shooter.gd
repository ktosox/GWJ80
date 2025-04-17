extends Node2D

@export var gun_A : PackedScene

@export var gun_B : PackedScene


@export var spin_speed = 1.0 # spins per second

@export var cooldown = 2.0



func _ready() -> void:
	$SpinAnimator.speed_scale = spin_speed
	if gun_A != null:
		var new_gun = gun_A.instantiate()
		new_gun.cooldown = cooldown
		$GunSpotA.add_child(new_gun)
		
	if gun_B != null:
		var new_gun = gun_B.instantiate()
		new_gun.rotation = PI
		new_gun.cooldown = cooldown
		$GunSpotB.add_child(new_gun)
		
