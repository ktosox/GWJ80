extends Resource

class_name EnemyPackage # used for spawning enemies, contains all of the variables needed to create an Enemy

@export var ID = 0

@export var walk_speed = 20

enum Walkers {BOUNCY}

var walker_map ={
	Walkers.BOUNCY : preload("res://enemy/walker/bouncy_walker.tscn"),
}

@export var walker_type : Walkers
