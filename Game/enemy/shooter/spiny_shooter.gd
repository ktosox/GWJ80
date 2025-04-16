extends Node2D

@export var gun_A : PackedScene

@export var gun_B : PackedScene


func _ready() -> void:
	if gun_A != null:
		var new_gun = gun_A.instantiate()
		new_gun.rotation = PI
		$GunSpotA.add_child(new_gun)
	if gun_B != null:
		var new_gun = gun_B.instantiate()
		$GunSpotB.add_child(new_gun)
