extends Node2D


func _ready() -> void:
	GameManager.set_health(100)
	$EnemySpawner.enemy_group_node = self
	$EnemySpawner.spawn_enemy(4,false)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		var new_flash = load("res://special/screen_cleaner.tscn").instantiate()
		add_child(new_flash)
