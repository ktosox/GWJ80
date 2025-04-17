extends Node2D

@export var possible_enemies : Array[EnemyPackage]

func _ready():
	spawn_random_enemy()
	
	pass
	
	

func spawn_random_enemy():
	var new_enemy = create_enemy_from_package(possible_enemies[randi()%possible_enemies.size()])
	new_enemy.connect("exit_tree",Callable(self,"spawn_random_enemy"))
	new_enemy.global_position = $SpawnPoint.global_position
	add_child(new_enemy)
	pass

func create_enemy_from_package(data : EnemyPackage) -> RigidBody2D:
	var new_walker = data.get_walker().instantiate()
	new_walker.speed = data.walk_speed
	var new_shooter = data.get_shooter().instantiate()
	new_shooter.attack_speed = data.attack_speed
	new_walker.add_child(new_shooter)
	return new_walker
