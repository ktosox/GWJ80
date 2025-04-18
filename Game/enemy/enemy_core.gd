extends Node2D # meant to be the child of Walker which acts as legs
				# and the parent of everything else: hit_box, Shooter
				# re-uses code from enemy.gd orignaly written by Positron
@export var health = 3

const PICKUP = preload("res://pick_up/pickup.tscn")
var spawn_pickup : bool 

func delete_this_enemy():
	get_parent().queue_free()
	pass


func _on_hit_box_hit_detected() -> void:
	health -= 1
	if(health <= 0):
		GameManager.change_score(1)
		if(spawn_pickup):
			var pick_up = PICKUP.instantiate()
			get_parent().get_parent().add_child(pick_up)
			pick_up.global_position = global_position
		delete_this_enemy()
	pass # Replace with function body.
