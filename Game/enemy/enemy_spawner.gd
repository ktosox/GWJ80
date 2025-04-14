extends Node2D


@export var basic_enemy_scene : PackedScene
@export var fast_enemy_scene : PackedScene
@export var strong_enemy_scene : PackedScene

@export var tracked_player : Node2D

@onready var enemy_group_node = get_parent().get_parent().get_node("enemy_group_node")

func _ready():
	pass
		
func spawn_enemy(wave : int):
	
	var random_enemy = randi_range(0, floor(wave/3))
	if(random_enemy > 2):
		random_enemy = randi_range(0, 2)
		
	get_enemy(random_enemy)
	
	
	


func get_enemy(random_enemy : int):
	if(random_enemy == 0):
		var new_enemy = basic_enemy_scene.instantiate() as RigidBody2D
		new_enemy.global_position = global_position
		new_enemy.target = tracked_player
		new_enemy.walk_towards_target = true
		new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
		enemy_group_node.add_child(new_enemy)
	elif(random_enemy == 1):
		var new_enemy = strong_enemy_scene.instantiate() as RigidBody2D
		new_enemy.global_position = global_position
		new_enemy.target = tracked_player
		new_enemy.walk_towards_target = true
		new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
		enemy_group_node.add_child(new_enemy)
	elif(random_enemy == 2):
		var new_enemy = fast_enemy_scene.instantiate() as RigidBody2D
		new_enemy.global_position = global_position
		new_enemy.target = tracked_player
		new_enemy.walk_towards_target = true
		new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
		enemy_group_node.add_child(new_enemy)
	
