extends Node2D

@export var guns : Array[PackedScene]


@export var spin_speed = 1.0 # spins per second

@export var attack_speed = 2.0

@export var bullet_speed = 60

func _ready() -> void:
	$SpinAnimator.advance(randf())
	$SpinAnimator.speed_scale = spin_speed
	if guns.size() > 0:
		
		var new_gun = guns.pop_front().instantiate()
		new_gun.cooldown = attack_speed
		new_gun.bullet_speed = bullet_speed
		$GunSpotA.add_child(new_gun)
		
	if guns.size() > 0:
		var new_gun = guns.pop_front().instantiate()
		new_gun.rotation = PI
		new_gun.cooldown = attack_speed
		new_gun.bullet_speed = bullet_speed
		$GunSpotB.add_child(new_gun)
		
