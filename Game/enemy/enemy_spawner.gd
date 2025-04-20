extends Node2D

@export var all_enemy_packages : Array[EnemyPackage]

@export var basic_enemy_scene : PackedScene
@export var fast_enemy_scene : PackedScene
@export var strong_enemy_scene : PackedScene

@export var tracked_player : Node2D

@onready var enemy_group_node = get_parent().get_parent().get_node("enemy_group_node")

func _ready():

	pass
		
func spawn_enemy(wave : int, spawn_pick_up : bool):
	
	#var random_enemy = randi_range(0, floor(wave/3))
	#if(random_enemy > 2):
		#random_enemy = randi_range(0, 2)
	#
	#get_enemy(random_enemy, spawn_pick_up)
	var chosen_enemy_package = all_enemy_packages[min(max(0,wave-2+randi()%2), 3)]
	chosen_enemy_package.spawn_pick_up = spawn_pick_up
	var new_enemy = create_enemy_from_package(chosen_enemy_package)
	await get_tree().create_timer(0.5).timeout # give it a moment to prevent an error

	new_enemy.global_position = global_position
	#new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
	enemy_group_node.add_child(new_enemy)
	


func get_enemy(random_enemy : int, spawn_pick_up : bool):
	if(random_enemy == 0):
		var new_enemy = basic_enemy_scene.instantiate() as RigidBody2D
		new_enemy.global_position = global_position
		if(spawn_pick_up):
			new_enemy.spawn_pickup = true
		else:
			new_enemy.spawn_pickup = false
		new_enemy.target = tracked_player
		new_enemy.walk_towards_target = true
		new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
		enemy_group_node.add_child(new_enemy)
		
	elif(random_enemy == 1):
		var new_enemy = strong_enemy_scene.instantiate() as RigidBody2D
		new_enemy.global_position = global_position
		if(spawn_pick_up):
			new_enemy.spawn_pickup = true
		else:
			new_enemy.spawn_pickup = false
		new_enemy.target = tracked_player
		new_enemy.walk_towards_target = true
		new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
		enemy_group_node.add_child(new_enemy)
	elif(random_enemy == 2):
		var new_enemy = fast_enemy_scene.instantiate() as RigidBody2D
		new_enemy.global_position = global_position
		if(spawn_pick_up):
			new_enemy.spawn_pickup = true
		else:
			new_enemy.spawn_pickup = false
		new_enemy.target = tracked_player
		new_enemy.walk_towards_target = true
		new_enemy.connect("tree_exiting",Callable(self,"spawn_enemy"))
		enemy_group_node.add_child(new_enemy)
	
	
func create_enemy_from_package(data : EnemyPackage) -> RigidBody2D:
	# set all the things
	var enemy_core = data.get_core().instantiate()
	enemy_core.health = data.health
	enemy_core.spawn_pick_up = data.spawn_pick_up
	var new_walker = data.get_walker().instantiate()
	new_walker.speed = data.walk_speed
	var new_shooter = data.get_shooter().instantiate()
	new_shooter.attack_speed = data.attack_speed
	new_shooter.guns = data.guns.duplicate()
	# connect stuff by add children
	new_walker.add_child(enemy_core)
	enemy_core.add_child(new_shooter)
	# return complete enemy
	return new_walker
