extends Node2D


func _ready() -> void:
	GameManager.set_health(100)
	$EnemySpawner.enemy_group_node = self
	$EnemySpawner.spawn_enemy(1)
