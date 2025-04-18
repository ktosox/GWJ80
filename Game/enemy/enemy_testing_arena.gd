extends Node2D

@export var possible_enemies : Array[EnemyPackage]

func _ready():
	spawn_random_enemy()
	GameManager.set_health(20)
	pass
	
	

func spawn_random_enemy():
	var new_enemy = create_enemy_from_package(possible_enemies[randi()%possible_enemies.size()])
	await get_tree().create_timer(0.5).timeout
	new_enemy.global_position = $SpawnPoint.global_position
	add_child(new_enemy)
	new_enemy.connect("tree_exiting",Callable(self,"spawn_random_enemy"))
	pass

func create_enemy_from_package(data : EnemyPackage) -> RigidBody2D:
	# set all the things
	var enemy_core = data.get_core().instantiate()
	enemy_core.health = data.health
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
