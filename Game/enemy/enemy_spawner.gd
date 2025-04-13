extends Node2D


@export var enemy_scene : PackedScene

@export var tracked_player : Node2D

func _ready():
	
	if(!get_parent().lose):
		spawn_enemy()



func spawn_enemy():
	await get_tree().create_timer(0.8).timeout
	var new_enemy = enemy_scene.instantiate() as RigidBody2D
	new_enemy.global_position = global_position
	new_enemy.target = tracked_player
	new_enemy.walk_towards_target = true
	new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
	get_parent().add_child(new_enemy)
	
	pass
