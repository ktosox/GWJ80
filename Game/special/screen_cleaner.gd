extends Node2D


func _ready():
	
	for bullet in get_tree().get_nodes_in_group("Bullet"):
		bullet.queue_free()
		
	pass
