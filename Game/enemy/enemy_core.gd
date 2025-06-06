extends Node2D # meant to be the child of Walker which acts as legs
				# and the parent of everything else: hit_box, Shooter
				# re-uses code from enemy.gd orignaly written by Positron
@export var health = 3
@export var ID = 0
const ENEMY_DEATH_SCENE = preload("res://enemy/enemy_death_scene.tscn")
const PICKUP = preload("res://pick_up/pickup.tscn")
var spawn_pick_up : bool 

func delete_this_enemy():
	var death_animation = ENEMY_DEATH_SCENE.instantiate()
	death_animation.global_position = global_position
	get_tree().current_scene.add_child(death_animation)
	if(spawn_pick_up):
		var pick_up = PICKUP.instantiate()
		get_tree().current_scene.add_child(pick_up)
		pick_up.global_position = global_position
	get_parent().queue_free()
	pass





func _on_hit_box_hit_detected() -> void:
	health -= 1
	var look_for_player = get_tree().get_nodes_in_group("Player")
	if look_for_player.size() > 0:
		$Splatter.look_at(look_for_player[0].global_position)
	$Splatter.set_deferred("emitting",true)
	if(health <= 0):
		var points = 1
		if ID > 2:
			points = 2
		GameManager.change_score(points)
		call_deferred("delete_this_enemy")

	pass # Replace with function body.
